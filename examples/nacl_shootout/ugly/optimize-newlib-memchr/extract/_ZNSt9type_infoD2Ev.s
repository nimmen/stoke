  .text
  .globl _ZNSt9type_infoD2Ev
  .type _ZNSt9type_infoD2Ev, @function

#! file-offset 0x123ea0
#! rip-offset  0xe3ea0
#! capacity    32 bytes

# Text                             #  Line  RIP      Bytes  Opcode              
._ZNSt9type_infoD2Ev:              #        0xe3ea0  0      OPC=<label>         
  popq %r11                        #  1     0xe3ea0  2      OPC=popq_r64_1      
  movl %edi, %edi                  #  2     0xe3ea2  2      OPC=movl_r32_r32    
  movl %edi, %edi                  #  3     0xe3ea4  2      OPC=movl_r32_r32    
  movl $0x1003d468, (%r15,%rdi,1)  #  4     0xe3ea6  8      OPC=movl_m32_imm32  
  andl $0xffffffe0, %r11d          #  5     0xe3eae  7      OPC=andl_r32_imm32  
  nop                              #  6     0xe3eb5  1      OPC=nop             
  nop                              #  7     0xe3eb6  1      OPC=nop             
  nop                              #  8     0xe3eb7  1      OPC=nop             
  nop                              #  9     0xe3eb8  1      OPC=nop             
  addq %r15, %r11                  #  10    0xe3eb9  3      OPC=addq_r64_r64    
  jmpq %r11                        #  11    0xe3ebc  3      OPC=jmpq_r64        
  nop                              #  12    0xe3ebf  1      OPC=nop             
  nop                              #  13    0xe3ec0  1      OPC=nop             
  nop                              #  14    0xe3ec1  1      OPC=nop             
  nop                              #  15    0xe3ec2  1      OPC=nop             
  nop                              #  16    0xe3ec3  1      OPC=nop             
  nop                              #  17    0xe3ec4  1      OPC=nop             
  nop                              #  18    0xe3ec5  1      OPC=nop             
  nop                              #  19    0xe3ec6  1      OPC=nop             
                                                                                
.size _ZNSt9type_infoD2Ev, .-_ZNSt9type_infoD2Ev
