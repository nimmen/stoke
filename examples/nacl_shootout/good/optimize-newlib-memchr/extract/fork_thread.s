  .text
  .globl fork_thread
  .type fork_thread, @function

#! file-offset 0x6d260
#! rip-offset  0x2d260
#! capacity    192 bytes

# Text                      #  Line  RIP      Bytes  Opcode              
.fork_thread:               #        0x2d260  0      OPC=<label>         
  pushq %rbx                #  1     0x2d260  1      OPC=pushq_r64_1     
  subl $0x20, %esp          #  2     0x2d261  3      OPC=subl_r32_imm8   
  addq %r15, %rsp           #  3     0x2d264  3      OPC=addq_r64_r64    
  movl %edi, %ebx           #  4     0x2d267  2      OPC=movl_r32_r32    
  movl $0x4, %edi           #  5     0x2d269  5      OPC=movl_r32_imm32  
  nop                       #  6     0x2d26e  1      OPC=nop             
  nop                       #  7     0x2d26f  1      OPC=nop             
  nop                       #  8     0x2d270  1      OPC=nop             
  nop                       #  9     0x2d271  1      OPC=nop             
  nop                       #  10    0x2d272  1      OPC=nop             
  nop                       #  11    0x2d273  1      OPC=nop             
  nop                       #  12    0x2d274  1      OPC=nop             
  nop                       #  13    0x2d275  1      OPC=nop             
  nop                       #  14    0x2d276  1      OPC=nop             
  nop                       #  15    0x2d277  1      OPC=nop             
  nop                       #  16    0x2d278  1      OPC=nop             
  nop                       #  17    0x2d279  1      OPC=nop             
  nop                       #  18    0x2d27a  1      OPC=nop             
  callq .malloc             #  19    0x2d27b  5      OPC=callq_label     
  movl %eax, %ecx           #  20    0x2d280  2      OPC=movl_r32_r32    
  movl %ecx, %ecx           #  21    0x2d282  2      OPC=movl_r32_r32    
  movl %ebx, (%r15,%rcx,1)  #  22    0x2d284  4      OPC=movl_m32_r32    
  leal 0x1c(%rsp), %edi     #  23    0x2d288  4      OPC=leal_r32_m16    
  movl $0x2d320, %edx       #  24    0x2d28c  5      OPC=movl_r32_imm32  
  xorl %esi, %esi           #  25    0x2d291  2      OPC=xorl_r32_r32    
  nop                       #  26    0x2d293  1      OPC=nop             
  nop                       #  27    0x2d294  1      OPC=nop             
  nop                       #  28    0x2d295  1      OPC=nop             
  nop                       #  29    0x2d296  1      OPC=nop             
  nop                       #  30    0x2d297  1      OPC=nop             
  nop                       #  31    0x2d298  1      OPC=nop             
  nop                       #  32    0x2d299  1      OPC=nop             
  nop                       #  33    0x2d29a  1      OPC=nop             
  callq .pthread_create     #  34    0x2d29b  5      OPC=callq_label     
  testl %eax, %eax          #  35    0x2d2a0  2      OPC=testl_r32_r32   
  jne .L_2d2c0              #  36    0x2d2a2  2      OPC=jne_label       
  xorl %eax, %eax           #  37    0x2d2a4  2      OPC=xorl_r32_r32    
  addl $0x20, %esp          #  38    0x2d2a6  3      OPC=addl_r32_imm8   
  addq %r15, %rsp           #  39    0x2d2a9  3      OPC=addq_r64_r64    
  popq %rbx                 #  40    0x2d2ac  1      OPC=popq_r64_1      
  popq %r11                 #  41    0x2d2ad  2      OPC=popq_r64_1      
  andl $0xffffffe0, %r11d   #  42    0x2d2af  7      OPC=andl_r32_imm32  
  nop                       #  43    0x2d2b6  1      OPC=nop             
  nop                       #  44    0x2d2b7  1      OPC=nop             
  nop                       #  45    0x2d2b8  1      OPC=nop             
  nop                       #  46    0x2d2b9  1      OPC=nop             
  addq %r15, %r11           #  47    0x2d2ba  3      OPC=addq_r64_r64    
  jmpq %r11                 #  48    0x2d2bd  3      OPC=jmpq_r64        
  nop                       #  49    0x2d2c0  1      OPC=nop             
  nop                       #  50    0x2d2c1  1      OPC=nop             
  nop                       #  51    0x2d2c2  1      OPC=nop             
  nop                       #  52    0x2d2c3  1      OPC=nop             
  nop                       #  53    0x2d2c4  1      OPC=nop             
  nop                       #  54    0x2d2c5  1      OPC=nop             
  nop                       #  55    0x2d2c6  1      OPC=nop             
.L_2d2c0:                   #        0x2d2c7  0      OPC=<label>         
  movl %eax, %edi           #  56    0x2d2c7  2      OPC=movl_r32_r32    
  movl %eax, 0x8(%rsp)      #  57    0x2d2c9  4      OPC=movl_m32_r32    
  nop                       #  58    0x2d2cd  1      OPC=nop             
  nop                       #  59    0x2d2ce  1      OPC=nop             
  nop                       #  60    0x2d2cf  1      OPC=nop             
  nop                       #  61    0x2d2d0  1      OPC=nop             
  nop                       #  62    0x2d2d1  1      OPC=nop             
  nop                       #  63    0x2d2d2  1      OPC=nop             
  nop                       #  64    0x2d2d3  1      OPC=nop             
  nop                       #  65    0x2d2d4  1      OPC=nop             
  nop                       #  66    0x2d2d5  1      OPC=nop             
  nop                       #  67    0x2d2d6  1      OPC=nop             
  nop                       #  68    0x2d2d7  1      OPC=nop             
  nop                       #  69    0x2d2d8  1      OPC=nop             
  nop                       #  70    0x2d2d9  1      OPC=nop             
  nop                       #  71    0x2d2da  1      OPC=nop             
  nop                       #  72    0x2d2db  1      OPC=nop             
  nop                       #  73    0x2d2dc  1      OPC=nop             
  nop                       #  74    0x2d2dd  1      OPC=nop             
  nop                       #  75    0x2d2de  1      OPC=nop             
  nop                       #  76    0x2d2df  1      OPC=nop             
  nop                       #  77    0x2d2e0  1      OPC=nop             
  nop                       #  78    0x2d2e1  1      OPC=nop             
  callq .strerror           #  79    0x2d2e2  5      OPC=callq_label     
  movl %eax, %edx           #  80    0x2d2e7  2      OPC=movl_r32_r32    
  movl 0x8(%rsp), %esi      #  81    0x2d2e9  4      OPC=movl_r32_m32    
  movl $0x10039d10, %edi    #  82    0x2d2ed  5      OPC=movl_r32_imm32  
  xorl %eax, %eax           #  83    0x2d2f2  2      OPC=xorl_r32_r32    
  nop                       #  84    0x2d2f4  1      OPC=nop             
  nop                       #  85    0x2d2f5  1      OPC=nop             
  nop                       #  86    0x2d2f6  1      OPC=nop             
  nop                       #  87    0x2d2f7  1      OPC=nop             
  nop                       #  88    0x2d2f8  1      OPC=nop             
  nop                       #  89    0x2d2f9  1      OPC=nop             
  nop                       #  90    0x2d2fa  1      OPC=nop             
  nop                       #  91    0x2d2fb  1      OPC=nop             
  nop                       #  92    0x2d2fc  1      OPC=nop             
  nop                       #  93    0x2d2fd  1      OPC=nop             
  nop                       #  94    0x2d2fe  1      OPC=nop             
  nop                       #  95    0x2d2ff  1      OPC=nop             
  nop                       #  96    0x2d300  1      OPC=nop             
  nop                       #  97    0x2d301  1      OPC=nop             
  callq .ReportStatus       #  98    0x2d302  5      OPC=callq_label     
  nop                       #  99    0x2d307  1      OPC=nop             
  nop                       #  100   0x2d308  1      OPC=nop             
  nop                       #  101   0x2d309  1      OPC=nop             
  nop                       #  102   0x2d30a  1      OPC=nop             
  nop                       #  103   0x2d30b  1      OPC=nop             
  nop                       #  104   0x2d30c  1      OPC=nop             
  nop                       #  105   0x2d30d  1      OPC=nop             
  nop                       #  106   0x2d30e  1      OPC=nop             
  nop                       #  107   0x2d30f  1      OPC=nop             
  nop                       #  108   0x2d310  1      OPC=nop             
  nop                       #  109   0x2d311  1      OPC=nop             
  nop                       #  110   0x2d312  1      OPC=nop             
  nop                       #  111   0x2d313  1      OPC=nop             
  nop                       #  112   0x2d314  1      OPC=nop             
  nop                       #  113   0x2d315  1      OPC=nop             
  nop                       #  114   0x2d316  1      OPC=nop             
  nop                       #  115   0x2d317  1      OPC=nop             
  nop                       #  116   0x2d318  1      OPC=nop             
  nop                       #  117   0x2d319  1      OPC=nop             
  nop                       #  118   0x2d31a  1      OPC=nop             
  nop                       #  119   0x2d31b  1      OPC=nop             
  nop                       #  120   0x2d31c  1      OPC=nop             
  nop                       #  121   0x2d31d  1      OPC=nop             
  nop                       #  122   0x2d31e  1      OPC=nop             
  nop                       #  123   0x2d31f  1      OPC=nop             
  nop                       #  124   0x2d320  1      OPC=nop             
  nop                       #  125   0x2d321  1      OPC=nop             
  callq .abort              #  126   0x2d322  5      OPC=callq_label     
                                                                         
.size fork_thread, .-fork_thread
