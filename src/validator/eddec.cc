// Copyright 2013-2016 Stanford University
//
// Licensed under the Apache License, Version 2.0 (the License);
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an AS IS BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#include "src/validator/abstraction.h"
#include "src/validator/abstractions/block.h"
#include "src/validator/invariants/state_equality.h"
#include "src/validator/invariants/conjunction.h"
#include "src/validator/invariants/disjunction.h"
#include "src/validator/invariants/inequality.h"
#include "src/validator/invariants/memory_equality.h"
#include "src/validator/invariants/no_signals.h"
#include "src/validator/invariants/pointer_null.h"
#include "src/validator/dual.h"
#include "src/validator/eddec.h"
#include "src/validator/variable.h"


#include <set>

using namespace std;
using namespace stoke;
using namespace x64asm;

string string_ghost_start(x64asm::R64 r) {
  stringstream ss;
  ss << r << "_start";
  return ss.str();
}

string string_ghost_end(x64asm::R64 r) {
  stringstream ss;
  ss << r << "_end";
  return ss.str();
}

Invariant* EDdecValidator::get_fixed_invariant() const {

  auto result = new DisjunctionInvariant();

  if(no_string_overlap_) {
    for(auto r : string_params_) {
      for(auto s : string_params_) {
        if(r == s)
          continue;

        Variable r_start(string_ghost_start(r), false, 8);
        Variable r_end(string_ghost_end(r), false, 8);
        Variable s_start(string_ghost_start(r), false, 8);
        Variable s_end(string_ghost_end(r), false, 8);

        // r_end < s_start OR s_end < r_start
        result->add_invariant(new InequalityInvariant(s_end, r_start, true, false));
        result->add_invariant(new InequalityInvariant(r_end, s_start, true, false));
      }
    }
  }

  return result;
}

ConjunctionInvariant* EDdecValidator::get_initial_invariant(const Cfg& target) const {

  auto initial_invariant = new ConjunctionInvariant();
  auto sei = new StateEqualityInvariant(target.def_ins());
  initial_invariant->add_invariant(sei);
  initial_invariant->add_invariant(new MemoryEqualityInvariant());
  initial_invariant->add_invariant(new NoSignalsInvariant());

  for(auto r : string_params_) {
    Variable end_var(string_ghost_start(r), false);
    auto end_mem = new PointerNullInvariant(end_var, 1);
    initial_invariant->add_invariant(end_mem);
  }

  initial_invariant->add_invariant(get_fixed_invariant());

  return initial_invariant;
}



void EDdecValidator::transform_testcase(CpuState& tc) const {

  /** For each string argument, we need to insert a ghost value representing
   * the start and the end of each string. */
  for(auto r : string_params_) {

    stringstream start;
    start << r << "_start";
    stringstream end;
    end << r << "_end";

    tc.shadow[start.str()] = tc[r];

    // now we need to find the end of the string.
    CpuState copy = tc;
    M8 ptr(r);

    while(copy.is_valid(ptr) && copy[ptr].get_fixed_byte(0) != 0) {
      copy.update(r, copy[r]+1);
    }

    if(!copy.is_valid(ptr)) {
      cout << "Register " << r << endl;
      cout << tc << endl;
      cout << copy << endl;
      cout << "Address: " << hex << copy.get_addr(ptr) << endl;
      cout << "Size: " << ptr.size() << endl;
      cout << "Range? " << copy.in_range(copy.get_addr(ptr), 1) << endl;
      cout << "Valid? " << copy.is_valid(ptr) << endl;
      for(size_t i = 0; i < copy.segments.size(); ++i) {
        cout << "in range @ " << i << ": " << copy.segments[i].in_range(copy.get_addr(ptr)) << endl;
      }
      cout << "Memory value: " << copy[ptr].get_fixed_byte(0) << endl;
      throw VALIDATOR_ERROR("String doesn't have null terminator in test case.");
    }

    tc.shadow[end.str()] = copy[r];
  }

}



bool EDdecValidator::verify(const Cfg& init_target, const Cfg& init_rewrite) {

  init_mm();

  vector<CpuState> transformed_inputs;
  for(size_t i = 0; i < sandbox_->size(); ++i) {
    CpuState input = *sandbox_->get_input(i);
    transform_testcase(input);
    transformed_inputs.push_back(input);
  }
  sandbox_->clear_inputs();
  for(auto tc : transformed_inputs)
    sandbox_->insert_input(tc);

  Abstraction* target_automata = new BlockAbstraction(init_target, *sandbox_);
  Abstraction* rewrite_automata = new BlockAbstraction(init_rewrite, *sandbox_);

  DualAutomata dual(target_automata, rewrite_automata);

  // Manually program in some correspondences
  auto start_state = dual.start_state();

  // 1 -> 3
  DualAutomata::Edge edge_1_3(start_state, {1,4}, {1,2,3});
  dual.add_edge(edge_1_3);

  // 1 -> 8
  DualAutomata::Edge edge_1_8(start_state, {1,4,3,4,3,4,3,4,3,4,3,4,3,4,3,4}, {1,5,6,7,8});
  dual.add_edge(edge_1_8);

  // 1 -> 16
  DualAutomata::Edge edge_1_16_0(start_state, {1,4}, {1,5,6,16});
  DualAutomata::Edge edge_1_16_1(start_state, {1,4}, {1,5,6,7,16});
  dual.add_edge(edge_1_16_0);
  dual.add_edge(edge_1_16_1);

  // 1 -> 19
  DualAutomata::Edge edge_1_19_0(start_state, {1,4,5}, {1,5,6,16,19});
  DualAutomata::Edge edge_1_19_1(start_state, {1,4,5}, {1,5,6,7,16,19});
  dual.add_edge(edge_1_19_0);
  dual.add_edge(edge_1_19_1);

  // 3 -> 3
  auto stop3 = edge_1_3.to;
  DualAutomata::Edge edge_3_3(stop3, {3,4}, {4,3});
  dual.add_edge(edge_3_3);

  // 3 -> 8
  DualAutomata::Edge edge_3_8(stop3, {3,4,3,4,3,4,3,4,3,4,3,4,3,4,3,4}, {4,5,6,7,8});
  dual.add_edge(edge_3_8);

  // 3 -> 16
  DualAutomata::Edge edge_3_16_0(stop3, {3,4}, {4,5,6,16});
  DualAutomata::Edge edge_3_16_1(stop3, {3,4}, {4,5,6,7,16});
  dual.add_edge(edge_3_16_0);
  dual.add_edge(edge_3_16_1);

  // 3 -> 19
  DualAutomata::Edge edge_3_19_0(stop3, {3,4,5}, {4,5,6,16,19});
  DualAutomata::Edge edge_3_19_1(stop3, {3,4,5}, {4,5,6,7,16,19});
  DualAutomata::Edge edge_3_19_2(stop3, {3,4,5}, {19});
  dual.add_edge(edge_3_19_0);
  dual.add_edge(edge_3_19_1);
  dual.add_edge(edge_3_19_2);

  // 16 -> 17
  auto stop16 = edge_1_16_0.to;
  DualAutomata::Edge edge_16_17(stop16, {3,4}, {17});
  dual.add_edge(edge_16_17);

  // 16 -> 19
  DualAutomata::Edge edge_16_19(stop16, {5}, {19});
  dual.add_edge(edge_16_19);

  // 17 -> 19
  auto stop17 = edge_16_17.to;
  DualAutomata::Edge edge_17_19(stop17, {5}, {19});
  dual.add_edge(edge_17_19);

  // 17 -> 16
  DualAutomata::Edge edge_17_16(stop17, {3,4}, {18,16});
  dual.add_edge(edge_17_16);

  // Learn invariants at each of the reachable states.
  dual.learn_invariants(*sandbox_, learner_);

  // At the initial state, we say what invariant goes.
  auto initial_invariant = get_initial_invariant(init_target);
  dual.set_invariant(start_state, static_cast<Invariant*>(initial_invariant));

  // Now we run a fixedpoint algorithm to get the provable invariants
  auto all_states = dual.get_reachable_states();
  set<DualAutomata::State> worklist;
  worklist = all_states;

  // TODO: we can make this faster if the worklist contains *edges* rather than
  //   states.
  while (worklist.size()) {
    // Pick a state
    auto current = worklist.begin();

    bool ok = true;
    for (auto edge : dual.next_edges(*current)) {
      // check this edge
      auto start_inv = dual.get_invariant(edge.from);
      auto end_inv = static_cast<ConjunctionInvariant*>(dual.get_invariant(edge.to));

      cout << "_____________________________" << endl;
      cout << "Edge: " << edge.from << " -> " << edge.to << endl;

      // check the invariants in the conjunction one at a time
      for (size_t i = 0; i < end_inv->size(); ++i) {
        auto partial_inv = (*end_inv)[i];
        cout << "  Proving " << *partial_inv << endl;
        bool valid = false;
        try {
          valid = check(init_target, init_rewrite, edge.te, edge.re, *start_inv, *partial_inv);
        } catch (validator_error e) {
          valid = false;
          cout << "   * encountered " << e.what() << "; assuming false.";
        }
        //bool valid = true;
        cout << "    " << (valid ? "true" : "false") << endl;
        if (!valid) {
          ok = false;
          end_inv->remove(i);
          i--;
        }
      }
    }

    if (!ok) {
      // add all successors of 'current' to the worklist
      // remove 'current' from the worklist
      auto tmp = *current;
      worklist.erase(current);
      auto to_add = dual.next_states(tmp);
      worklist.insert(to_add.begin(), to_add.end());
    } else {
      // remove 'current' from the worklist
      worklist.erase(current);
    }
  }

  // Finally, print the learned invariant at (5,19)
  auto return_state = edge_1_19_0.to;
  auto return_inv = static_cast<ConjunctionInvariant*>(dual.get_invariant(return_state));
  cout << endl << " XXXXXXX PROVEN RELATIONSHIPS AT RETURN XXXXXXX " << endl << endl;
  for (size_t i = 0; i < return_inv->size(); ++i) {
    cout << *(*return_inv)[i] << endl;
  }


  reset_mm();
  return false;
}

/*
// For debugging
set<Abstraction::State> states_visited;
set<Abstraction::State> current_set;
set<Abstraction::State> next_set;

next_set.insert(rewrite_automata->start_state());
while(next_set.size()) {
  current_set = next_set;
  next_set.clear();
  for(auto s : current_set) {
    for(auto t : rewrite_automata->next_states(s)) {
      if(!states_visited.count(t)) {
        cout << t << endl;
        states_visited.insert(t);
        next_set.insert(t);
      }
    }
  }
}*/