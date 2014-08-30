
#ifndef STOKE_SRC_NORMALIZER_CHUNK_H
#define STOKE_SRC_NORMALIZER_CHUNK_H

#include <vector>

#include "src/ext/x64asm/include/x64asm.h"


namespace stoke {

class Chunk {

  public:

    Chunk(std::vector<x64asm::Instruction>& code) : _code(code) {

    }

    void normalize();

  private:
//    x64asm::RegSet& _def_ins;
//    x64asm::RegSet& _live_outs;
//    x64asm::RegSet& _available;
    std::vector<x64asm::Instruction>& _code;

};

}

#endif
