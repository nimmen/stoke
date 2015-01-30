// Copyright 2013-2015 Eric Schkufza, Rahul Sharma, Berkeley Churchill, Stefan Heule
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#ifndef STOKE_SRC_SANDBOX_SANDBOX_H
#define STOKE_SRC_SANDBOX_SANDBOX_H

#include <unordered_map>
#include <vector>

#include "src/ext/cpputil/include/container/maputil.h"
#include "src/ext/x64asm/include/x64asm.h"

#include "src/cfg/cfg.h"
#include "src/sandbox/io_pair.h"
#include "src/sandbox/input_iterator.h"
#include "src/sandbox/output_iterator.h"
#include "src/sandbox/state_callback.h"
#include "src/state/cpu_state.h"

namespace stoke {

class Sandbox {
public:
  /** Iterator for function source */
  typedef cpputil::CppUtilMap<std::unordered_map<x64asm::Label, Cfg>>::const_value_iterator function_iterator;

  /** Returns true if this instruction is supported. */
  static bool is_supported(const x64asm::Instruction& instr) {
    return is_supported(instr.get_opcode());
  }
  /** Returns true if this opcode is supported. */
  static bool is_supported(x64asm::Opcode o);

  /** Creates a sandbox. */
  Sandbox();
  /** Deletes a sandbox. */
  ~Sandbox() {
    clear_inputs();
    clear_functions();
  }

  /** Sets whether the sandbox should report sigsegv for abi violations. */
  Sandbox& set_abi_check(bool check) {
    abi_check_ = check;
    return *this;
  }
  /** Sets the maximum number of jumps taken before raising SIGINT. */
  Sandbox& set_max_jumps(size_t jumps) {
    max_jumps_ = jumps;
    return *this;
  }

  /** Add a new input. */
  Sandbox& insert_input(const CpuState& input);
  /** Clear input set. */
  Sandbox& clear_inputs();
  /** Returns the number of inputs installed so far. */
  size_t num_inputs() const {
    return io_pairs_.size();
  }

  /** Iterator for input states. */
  input_iterator get_input(size_t index) const {
    assert(index < size());
    return input_iterator(io_pairs_.begin() + index);
  }
  /** Iterator for input states. */
  input_iterator input_begin() const {
    return input_iterator(io_pairs_.begin());
  }
  /** Iterator for input states. */
  input_iterator input_end() const {
    return input_iterator(io_pairs_.end());
  }

  /** Iterator for output states. */
  output_iterator get_output(size_t index) const {
    assert(index < size());
    return output_iterator(io_pairs_.begin() + index);
  }
  /** Iterator for output states. */
  output_iterator output_begin() const {
    return output_iterator(io_pairs_.begin());
  }
  /** Iterator for output states. */
  output_iterator output_end() const {
    return output_iterator(io_pairs_.end());
  }

  /** Compile a function. */
  Sandbox& insert_function(const Cfg& cfg);
  /** Clear functions. */
  Sandbox& clear_functions();
  /** Returns the number of compiled functions */
  size_t num_functions() const {
    return fxns_.size();
  }
  /** Does a function with this name exist? */
  bool contains_function(const x64asm::Label& l) {
    return fxns_.find(l) != fxns_.end();
  }

  /** Returns a function */
  function_iterator get_function(const x64asm::Label& l) const {
    assert(contains(l));
    return function_iterator(fxns_src_.find(l));
  }
  /** Iterator over functions */
  function_iterator function_begin() const {
    return fxns_src_.value_cbegin();
  }
  /** Iterator over functions. */
  function_iterator function_end() const {
    return fxns_src_.value_cend();
  }

  /** Insert a callback to be invoked prior to any line in any function. */
  Sandbox& insert_before(StateCallback cb, void* arg);
  /** Insert a callback to be invoked prior to any line in any function. */
  Sandbox& insert_after(StateCallback cb, void* arg);
  /** Clears the set of callbacks to invoke during execution. */
  Sandbox& clear_callbacks();

  /** Designates a function as the entrypoint. */
  Sandbox& set_entrypoint(const x64asm::Label& l) {
    assert(contains_function(l));
    main_fxn_ = l;
    return *this;
  }
  /** Run a main function for just one input. */
  Sandbox& run(size_t index);
  /** Run a main function for all inputs. */
  Sandbox& run();

  /** Flag labels allocated after this call as disposable. */
  void start_reusing_labels() {
    label_checkpoint_ = next_label_;
  }
  /** Start recycling any labels that were allocated since the last call to
    start_reusing_labels(); invalidates EVERYTHING that was sandboxed in
    the interim. Make sure you know what you're doing. */
  void start_recycling_labels() {
    next_label_ = label_checkpoint_;
  }

  /** @deprecated */
  size_t size() const {
    return num_inputs();
  }
  /** @deprecated */
  output_iterator get_result(size_t index) const {
    return get_output(index);
  }
  /** @deprecated */
  output_iterator result_begin() const {
    return output_begin();
  }
  /** @deprecated */
  output_iterator result_end() const {
    return output_end();
  }
  /** @deprecated */
  void compile(const Cfg& cfg) {
    insert_function(cfg);
    set_entrypoint(cfg.get_code()[0].get_operand<x64asm::Label>(0));
  }
  /** @deprecated */
  void compile_main(const Cfg& cfg) {
    insert_function(cfg);
    set_entrypoint(cfg.get_code()[0].get_operand<x64asm::Label>(0));
  }
  /** @deprecated */
  Sandbox& insert_before(size_t line, StateCallback cb, void* arg) {
    return *this;
  }
  /** @deprecated */
  Sandbox& insert_after(size_t line, StateCallback cb, void* arg) {
    return *this;
  }
  /** @deprecated */
  size_t num_callbacks() const {
    return 0;
  }
  /** @deprecated */
  const Cfg& get_main() const {
    const auto itr = fxns_src_.find(main_fxn_);
    assert(itr != fxns_src_.end());
    return itr->second;
  }
  /** @deprecated  */
  void run(const Cfg& cfg) {
    insert_function(cfg);
    set_entrypoint(cfg.get_code()[0].get_operand<x64asm::Label>(0));
    run();
  }
  /** @deprecated */
  void run_one(size_t index) {
    run(index);
  }
  /** @deprecated */
  void run_all() {
    run();
  }

private:
  /** Should the sandbox report errors for linux abi violations? */
  bool abi_check_;
  /** The maximum number of jumps to take before raising SIGINT. */
  size_t max_jumps_;

  /** Assembler, no sense in always creating these. */
  x64asm::Assembler assm_;
  /** Linker, no sense in always creating these either. */
  x64asm::Linker lnkr_;

  /** I/O pairs. These are pointers to simplify vector reallocations. */
  std::vector<IoPair*> io_pairs_;

  /** Global callback to invoke before any line is executed. */
  std::pair<StateCallback, void*> global_before_;
  /** Global callback to invoke after any line is executed. */
  std::pair<StateCallback, void*> global_after_;

  /** Reusable labels... if left unchecked, endless sandboxing will deplete memory */
  std::vector<x64asm::Label> labels_;
  /** The label that was available the last time start_reusing_labels() was called */
  size_t label_checkpoint_;
  /** The next label to pull out of the pool. */
  size_t next_label_;

  /** Scratch space used here and there by sandboxing code. */
  uint64_t scratch_[16];

  /** How many more jumps can be made before SIGKILL? */
  size_t jumps_remaining_;

  /** Pointer to the user's state */
  void* out_;
  /** Pointer to a function for writing the user's input state (modulo rsp) to the cpu */
  void* in2cpu_;
  /** Pointer to a function for writing the user's output state (modulo rsp) to the cpu */
  void* out2cpu_;
  /** Pointer to a function for reading the user's output state (all of it) from the cpu */
  void* cpu2out_;
  /** Pointer to a function for mapping virtual addresses to physical addresses */
  void* map_addr_;
  /** Address of the main function's entrypoint */
  void* entrypoint_;

  /** The user's current %rsp */
  uint64_t user_rsp_;
  /** The harness's %rsp */
  uint64_t harness_rsp_;
  /** STOKE's %rsp */
  uint64_t stoke_rsp_;

  /** Pointer to the current function buffer */
  x64asm::Function* fxn_;
  /** Pointer to the harness function */
  x64asm::Function harness_;
  /** Pointer to the signal trap function */
  x64asm::Function signal_trap_;
  /** Functions that the code may invoke at runtime. Pointers to simplify reallocation. */
  cpputil::CppUtilMap<std::unordered_map<x64asm::Label, x64asm::Function*>> fxns_;
  /** Pointer to the current main function */
  x64asm::Label main_fxn_;

  /** Auxiliary function source (saved in case recompilation is necessary). */
  cpputil::CppUtilMap<std::unordered_map<x64asm::Label, Cfg>> fxns_src_;
  /** Flags that track whether a function is memory read only */
  cpputil::CppUtilMap<std::unordered_map<x64asm::Label, bool>> fxns_read_only_;
  /** The logical and of all of the elements in fxns_read_only_ */
  bool all_fxns_read_only_;

  /** Check for abi violations between input and output states */
  bool check_abi(const IoPair& iop) const;

  /** Returns a register that doesn't appear in an instruction or the scratch space. */
  size_t get_unused_reg(const x64asm::Instruction& instr) const;
  /** Returns an unused word register. */
  const x64asm::R16& get_unused_word(const x64asm::Instruction& instr) const {
    return x64asm::r16s[get_unused_reg(instr)];
  }
  /** Returns an unused quad register. */
  const x64asm::R64& get_unused_quad(const x64asm::Instruction& instr) const {
    return x64asm::r64s[get_unused_reg(instr)];
  }

  /** Initialize the reusable label pool */
  void init_labels() {
    labels_.resize(16);
    label_checkpoint_ = 0;
    next_label_ = 0;
  }
  /** Take a label from the pool. */
  const x64asm::Label& get_label() {
    if (next_label_ == labels_.size()) {
      labels_.resize(labels_.size()*2);
    }
    return labels_[next_label_++];
  }

  /** Recompiles a function */
  void recompile(const Cfg& cfg);
  /** Recompiles every function */
  void recompile();

  /** Assembles the harness function */
  x64asm::Function emit_harness();
  /** Assembles a signal handler trap */
  x64asm::Function emit_signal_trap();
  /** Assembles a function for writing user state (modulo rsp) to the cpu */
  x64asm::Function emit_state2cpu(const CpuState& cs);
  /** Assembles a function for reading user state from the cpu */
  x64asm::Function emit_cpu2state(CpuState& cs);
  /** Returns a function that maps virtual addresses to physical addresses. */
  x64asm::Function emit_map_addr(CpuState& cs);
  /** Returns code to check memory for validity and then toggle def bits. */
  void emit_map_addr_cases(CpuState& cs, const x64asm::Label& fail, const x64asm::Label& done,
                           bool stack);

  /** Check whether a function is read only wrt memory */
  bool is_mem_read_only(const Cfg& cfg) const;
  /** Assembles the user's function into a buffer */
  void emit_function(const Cfg& cfg, x64asm::Function* fxn);
  /** Emit a single callback for this line. */
  void emit_callback(const std::pair<StateCallback, void*>& cb, size_t line);
  /** Emit an instruction (and possibly sandbox memory). */
  void emit_instruction(const x64asm::Instruction& instr, const x64asm::Label& exit);
  /** Emit a memory instruction. */
  void emit_memory_instruction(const x64asm::Instruction& instr);
  /** Emit a jump instruction */
  void emit_jump(const x64asm::Instruction& instr);
  /** Emit the CALL LABEL instruction. */
  void emit_call(const x64asm::Instruction& instr);
  /** Emit the RET instruction. */
  void emit_ret(const x64asm::Instruction& instr, const x64asm::Label& exit);

  /** Special case for emitting bt instructions that read from memory. */
  void emit_mem_bt(const x64asm::Instruction& instr);
  /** Special case for emitting div instructions that read from memory. */
  void emit_mem_div(const x64asm::Instruction& instr);
  /** Special case for emitting pop to memory. */
  void emit_mem_pop(const x64asm::Instruction& instr);
  /** Special case for emitting push from memory. */
  void emit_mem_push(const x64asm::Instruction& instr);
  /** Special case for emitting pop. */
  void emit_pop(const x64asm::Instruction& instr);
  /** Special case for emitting popf. */
  void emit_popf(const x64asm::Instruction& instr);
  /** Special case for emitting push. */
  void emit_push(const x64asm::Instruction& instr);
  /** Special case for emitting pushf. */
  void emit_pushf(const x64asm::Instruction& instr);
  /** Special case for emitting div instructions that read from registers. */
  void emit_reg_div(const x64asm::Instruction& instr);

  /** Emits a bail-out call to the signal trap */
  void emit_signal_trap_call(ErrorCode ec);
  /** Emit code that swaps stoke_rsp_ out of and user_rsp_ into %rsp */
  void emit_load_user_rsp();
  /** Emit code that swaps user_rsp_ out of and stoke_rsp_ into %rsp */
  void emit_load_stoke_rsp();
};

} // namespace stoke

#endif
