  .text
  .globl _ZNSt13basic_filebufIcSt11char_traitsIcEE6xsputnEPKci
  .type _ZNSt13basic_filebufIcSt11char_traitsIcEE6xsputnEPKci, @function

#! file-offset 0x12be00
#! rip-offset  0xebe00
#! capacity    576 bytes

# Text                                                               #  Line  RIP      Bytes  Opcode    
._ZNSt13basic_filebufIcSt11char_traitsIcEE6xsputnEPKci:              #        0xebe00  0      OPC=0     
  movq %rbx, -0x20(%rsp)                                             #  1     0xebe00  5      OPC=1138  
  movl %edi, %ebx                                                    #  2     0xebe05  2      OPC=1157  
  movq %r12, -0x18(%rsp)                                             #  3     0xebe07  5      OPC=1138  
  movq %r13, -0x10(%rsp)                                             #  4     0xebe0c  5      OPC=1138  
  movq %r14, -0x8(%rsp)                                              #  5     0xebe11  5      OPC=1138  
  subl $0x28, %esp                                                   #  6     0xebe16  3      OPC=2384  
  addq %r15, %rsp                                                    #  7     0xebe19  3      OPC=72    
  nop                                                                #  8     0xebe1c  1      OPC=1343  
  nop                                                                #  9     0xebe1d  1      OPC=1343  
  nop                                                                #  10    0xebe1e  1      OPC=1343  
  nop                                                                #  11    0xebe1f  1      OPC=1343  
  movl %ebx, %ebx                                                    #  12    0xebe20  2      OPC=1157  
  movl 0x70(%r15,%rbx,1), %edi                                       #  13    0xebe22  5      OPC=1156  
  movl %edx, %r12d                                                   #  14    0xebe27  3      OPC=1157  
  movl %esi, %r13d                                                   #  15    0xebe2a  3      OPC=1157  
  movl %ebx, %ebx                                                    #  16    0xebe2d  2      OPC=1157  
  movl 0x3c(%r15,%rbx,1), %r14d                                      #  17    0xebe2f  5      OPC=1156  
  testq %rdi, %rdi                                                   #  18    0xebe34  3      OPC=2438  
  je .L_ebfe0                                                        #  19    0xebe37  6      OPC=893   
  nop                                                                #  20    0xebe3d  1      OPC=1343  
  nop                                                                #  21    0xebe3e  1      OPC=1343  
  nop                                                                #  22    0xebe3f  1      OPC=1343  
  movl %edi, %edi                                                    #  23    0xebe40  2      OPC=1157  
  movl (%r15,%rdi,1), %eax                                           #  24    0xebe42  4      OPC=1156  
  movl %eax, %eax                                                    #  25    0xebe46  2      OPC=1157  
  movl 0x18(%r15,%rax,1), %eax                                       #  26    0xebe48  5      OPC=1156  
  nop                                                                #  27    0xebe4d  1      OPC=1343  
  nop                                                                #  28    0xebe4e  1      OPC=1343  
  nop                                                                #  29    0xebe4f  1      OPC=1343  
  nop                                                                #  30    0xebe50  1      OPC=1343  
  nop                                                                #  31    0xebe51  1      OPC=1343  
  nop                                                                #  32    0xebe52  1      OPC=1343  
  nop                                                                #  33    0xebe53  1      OPC=1343  
  nop                                                                #  34    0xebe54  1      OPC=1343  
  nop                                                                #  35    0xebe55  1      OPC=1343  
  nop                                                                #  36    0xebe56  1      OPC=1343  
  nop                                                                #  37    0xebe57  1      OPC=1343  
  andl $0xffffffe0, %eax                                             #  38    0xebe58  6      OPC=131   
  nop                                                                #  39    0xebe5e  1      OPC=1343  
  nop                                                                #  40    0xebe5f  1      OPC=1343  
  nop                                                                #  41    0xebe60  1      OPC=1343  
  addq %r15, %rax                                                    #  42    0xebe61  3      OPC=72    
  callq %rax                                                         #  43    0xebe64  2      OPC=258   
  testb %al, %al                                                     #  44    0xebe66  2      OPC=2440  
  je .L_ebf60                                                        #  45    0xebe68  6      OPC=893   
  andl $0x10, %r14d                                                  #  46    0xebe6e  4      OPC=132   
  je .L_ebf60                                                        #  47    0xebe72  6      OPC=893   
  movl %ebx, %ebx                                                    #  48    0xebe78  2      OPC=1157  
  cmpb $0x0, 0x61(%r15,%rbx,1)                                       #  49    0xebe7a  6      OPC=461   
  jne .L_ebf60                                                       #  50    0xebe80  6      OPC=963   
  movl %ebx, %ebx                                                    #  51    0xebe86  2      OPC=1157  
  movl 0x14(%r15,%rbx,1), %r14d                                      #  52    0xebe88  5      OPC=1156  
  movl %ebx, %ebx                                                    #  53    0xebe8d  2      OPC=1157  
  movl 0x18(%r15,%rbx,1), %eax                                       #  54    0xebe8f  5      OPC=1156  
  subl %r14d, %eax                                                   #  55    0xebe94  3      OPC=2386  
  movl %ebx, %ebx                                                    #  56    0xebe97  2      OPC=1157  
  cmpb $0x0, 0x62(%r15,%rbx,1)                                       #  57    0xebe99  6      OPC=461   
  jne .L_ebec0                                                       #  58    0xebe9f  6      OPC=963   
  nop                                                                #  59    0xebea5  1      OPC=1343  
  nop                                                                #  60    0xebea6  1      OPC=1343  
  nop                                                                #  61    0xebea7  1      OPC=1343  
  nop                                                                #  62    0xebea8  1      OPC=1343  
  nop                                                                #  63    0xebea9  1      OPC=1343  
  nop                                                                #  64    0xebeaa  1      OPC=1343  
  nop                                                                #  65    0xebeab  1      OPC=1343  
  movl %ebx, %ebx                                                    #  66    0xebeac  2      OPC=1157  
  movl 0x5c(%r15,%rbx,1), %edx                                       #  67    0xebeae  5      OPC=1156  
  leal -0x1(%rdx), %ecx                                              #  68    0xebeb3  3      OPC=1066  
  cmpl $0x2, %edx                                                    #  69    0xebeb6  3      OPC=470   
  cmovael %ecx, %eax                                                 #  70    0xebeb9  3      OPC=278   
  nop                                                                #  71    0xebebc  1      OPC=1343  
  nop                                                                #  72    0xebebd  1      OPC=1343  
  nop                                                                #  73    0xebebe  1      OPC=1343  
  nop                                                                #  74    0xebebf  1      OPC=1343  
  nop                                                                #  75    0xebec0  1      OPC=1343  
  nop                                                                #  76    0xebec1  1      OPC=1343  
  nop                                                                #  77    0xebec2  1      OPC=1343  
  nop                                                                #  78    0xebec3  1      OPC=1343  
  nop                                                                #  79    0xebec4  1      OPC=1343  
  nop                                                                #  80    0xebec5  1      OPC=1343  
  nop                                                                #  81    0xebec6  1      OPC=1343  
  nop                                                                #  82    0xebec7  1      OPC=1343  
  nop                                                                #  83    0xebec8  1      OPC=1343  
  nop                                                                #  84    0xebec9  1      OPC=1343  
  nop                                                                #  85    0xebeca  1      OPC=1343  
  nop                                                                #  86    0xebecb  1      OPC=1343  
.L_ebec0:                                                            #        0xebecc  0      OPC=0     
  cmpl $0x400, %eax                                                  #  87    0xebecc  5      OPC=451   
  movl $0x400, %edx                                                  #  88    0xebed1  5      OPC=1154  
  cmovgel %edx, %eax                                                 #  89    0xebed6  3      OPC=314   
  cmpl %r12d, %eax                                                   #  90    0xebed9  3      OPC=472   
  jg .L_ebf60                                                        #  91    0xebedc  6      OPC=901   
  movl %ebx, %ebx                                                    #  92    0xebee2  2      OPC=1157  
  movl 0x10(%r15,%rbx,1), %esi                                       #  93    0xebee4  5      OPC=1156  
  leal 0x34(%rbx), %edi                                              #  94    0xebee9  3      OPC=1066  
  movl %r12d, %r8d                                                   #  95    0xebeec  3      OPC=1157  
  movl %r13d, %ecx                                                   #  96    0xebeef  3      OPC=1157  
  subl %esi, %r14d                                                   #  97    0xebef2  3      OPC=2386  
  movl %r14d, %edx                                                   #  98    0xebef5  3      OPC=1157  
  addl %r14d, %r12d                                                  #  99    0xebef8  3      OPC=67    
  nop                                                                #  100   0xebefb  1      OPC=1343  
  nop                                                                #  101   0xebefc  1      OPC=1343  
  nop                                                                #  102   0xebefd  1      OPC=1343  
  nop                                                                #  103   0xebefe  1      OPC=1343  
  nop                                                                #  104   0xebeff  1      OPC=1343  
  nop                                                                #  105   0xebf00  1      OPC=1343  
  nop                                                                #  106   0xebf01  1      OPC=1343  
  nop                                                                #  107   0xebf02  1      OPC=1343  
  nop                                                                #  108   0xebf03  1      OPC=1343  
  nop                                                                #  109   0xebf04  1      OPC=1343  
  nop                                                                #  110   0xebf05  1      OPC=1343  
  nop                                                                #  111   0xebf06  1      OPC=1343  
  callq ._ZNSt12__basic_fileIcE8xsputn_2EPKciS2_i                    #  112   0xebf07  5      OPC=260   
  cmpl %r12d, %eax                                                   #  113   0xebf0c  3      OPC=472   
  movl %eax, %r13d                                                   #  114   0xebf0f  3      OPC=1157  
  je .L_ebfa0                                                        #  115   0xebf12  6      OPC=893   
  nop                                                                #  116   0xebf18  1      OPC=1343  
  nop                                                                #  117   0xebf19  1      OPC=1343  
  nop                                                                #  118   0xebf1a  1      OPC=1343  
  nop                                                                #  119   0xebf1b  1      OPC=1343  
  nop                                                                #  120   0xebf1c  1      OPC=1343  
  nop                                                                #  121   0xebf1d  1      OPC=1343  
  nop                                                                #  122   0xebf1e  1      OPC=1343  
  nop                                                                #  123   0xebf1f  1      OPC=1343  
  nop                                                                #  124   0xebf20  1      OPC=1343  
  nop                                                                #  125   0xebf21  1      OPC=1343  
  nop                                                                #  126   0xebf22  1      OPC=1343  
  nop                                                                #  127   0xebf23  1      OPC=1343  
  nop                                                                #  128   0xebf24  1      OPC=1343  
  nop                                                                #  129   0xebf25  1      OPC=1343  
  nop                                                                #  130   0xebf26  1      OPC=1343  
  nop                                                                #  131   0xebf27  1      OPC=1343  
  nop                                                                #  132   0xebf28  1      OPC=1343  
  nop                                                                #  133   0xebf29  1      OPC=1343  
  nop                                                                #  134   0xebf2a  1      OPC=1343  
  nop                                                                #  135   0xebf2b  1      OPC=1343  
.L_ebf20:                                                            #        0xebf2c  0      OPC=0     
  movl %r13d, %edx                                                   #  136   0xebf2c  3      OPC=1157  
  xorl %eax, %eax                                                    #  137   0xebf2f  2      OPC=3758  
  movq 0x8(%rsp), %rbx                                               #  138   0xebf31  5      OPC=1161  
  subl %r14d, %edx                                                   #  139   0xebf36  3      OPC=2386  
  cmpl %r13d, %r14d                                                  #  140   0xebf39  3      OPC=472   
  movq 0x10(%rsp), %r12                                              #  141   0xebf3c  5      OPC=1161  
  cmovll %edx, %eax                                                  #  142   0xebf41  3      OPC=320   
  movq 0x18(%rsp), %r13                                              #  143   0xebf44  5      OPC=1161  
  nop                                                                #  144   0xebf49  1      OPC=1343  
  nop                                                                #  145   0xebf4a  1      OPC=1343  
  nop                                                                #  146   0xebf4b  1      OPC=1343  
  movq 0x20(%rsp), %r14                                              #  147   0xebf4c  5      OPC=1161  
  addl $0x28, %esp                                                   #  148   0xebf51  3      OPC=65    
  addq %r15, %rsp                                                    #  149   0xebf54  3      OPC=72    
  popq %r11                                                          #  150   0xebf57  2      OPC=1694  
  andl $0xffffffe0, %r11d                                            #  151   0xebf59  7      OPC=131   
  nop                                                                #  152   0xebf60  1      OPC=1343  
  nop                                                                #  153   0xebf61  1      OPC=1343  
  nop                                                                #  154   0xebf62  1      OPC=1343  
  nop                                                                #  155   0xebf63  1      OPC=1343  
  addq %r15, %r11                                                    #  156   0xebf64  3      OPC=72    
  jmpq %r11                                                          #  157   0xebf67  3      OPC=928   
  nop                                                                #  158   0xebf6a  1      OPC=1343  
  nop                                                                #  159   0xebf6b  1      OPC=1343  
  nop                                                                #  160   0xebf6c  1      OPC=1343  
  nop                                                                #  161   0xebf6d  1      OPC=1343  
  nop                                                                #  162   0xebf6e  1      OPC=1343  
  nop                                                                #  163   0xebf6f  1      OPC=1343  
  nop                                                                #  164   0xebf70  1      OPC=1343  
  nop                                                                #  165   0xebf71  1      OPC=1343  
  nop                                                                #  166   0xebf72  1      OPC=1343  
.L_ebf60:                                                            #        0xebf73  0      OPC=0     
  movl %r12d, %edx                                                   #  167   0xebf73  3      OPC=1157  
  movl %r13d, %esi                                                   #  168   0xebf76  3      OPC=1157  
  movl %ebx, %edi                                                    #  169   0xebf79  2      OPC=1157  
  movq 0x10(%rsp), %r12                                              #  170   0xebf7b  5      OPC=1161  
  movq 0x8(%rsp), %rbx                                               #  171   0xebf80  5      OPC=1161  
  movq 0x18(%rsp), %r13                                              #  172   0xebf85  5      OPC=1161  
  movq 0x20(%rsp), %r14                                              #  173   0xebf8a  5      OPC=1161  
  nop                                                                #  174   0xebf8f  1      OPC=1343  
  nop                                                                #  175   0xebf90  1      OPC=1343  
  nop                                                                #  176   0xebf91  1      OPC=1343  
  nop                                                                #  177   0xebf92  1      OPC=1343  
  addl $0x28, %esp                                                   #  178   0xebf93  3      OPC=65    
  addq %r15, %rsp                                                    #  179   0xebf96  3      OPC=72    
  jmpq ._ZNSt15basic_streambufIcSt11char_traitsIcEE6xsputnEPKci      #  180   0xebf99  5      OPC=930   
  nop                                                                #  181   0xebf9e  1      OPC=1343  
  nop                                                                #  182   0xebf9f  1      OPC=1343  
  nop                                                                #  183   0xebfa0  1      OPC=1343  
  nop                                                                #  184   0xebfa1  1      OPC=1343  
  nop                                                                #  185   0xebfa2  1      OPC=1343  
  nop                                                                #  186   0xebfa3  1      OPC=1343  
  nop                                                                #  187   0xebfa4  1      OPC=1343  
  nop                                                                #  188   0xebfa5  1      OPC=1343  
  nop                                                                #  189   0xebfa6  1      OPC=1343  
  nop                                                                #  190   0xebfa7  1      OPC=1343  
  nop                                                                #  191   0xebfa8  1      OPC=1343  
  nop                                                                #  192   0xebfa9  1      OPC=1343  
  nop                                                                #  193   0xebfaa  1      OPC=1343  
  nop                                                                #  194   0xebfab  1      OPC=1343  
  nop                                                                #  195   0xebfac  1      OPC=1343  
  nop                                                                #  196   0xebfad  1      OPC=1343  
  nop                                                                #  197   0xebfae  1      OPC=1343  
  nop                                                                #  198   0xebfaf  1      OPC=1343  
  nop                                                                #  199   0xebfb0  1      OPC=1343  
  nop                                                                #  200   0xebfb1  1      OPC=1343  
  nop                                                                #  201   0xebfb2  1      OPC=1343  
.L_ebfa0:                                                            #        0xebfb3  0      OPC=0     
  xorl %esi, %esi                                                    #  202   0xebfb3  2      OPC=3758  
  movl %ebx, %edi                                                    #  203   0xebfb5  2      OPC=1157  
  nop                                                                #  204   0xebfb7  1      OPC=1343  
  nop                                                                #  205   0xebfb8  1      OPC=1343  
  nop                                                                #  206   0xebfb9  1      OPC=1343  
  nop                                                                #  207   0xebfba  1      OPC=1343  
  nop                                                                #  208   0xebfbb  1      OPC=1343  
  nop                                                                #  209   0xebfbc  1      OPC=1343  
  nop                                                                #  210   0xebfbd  1      OPC=1343  
  nop                                                                #  211   0xebfbe  1      OPC=1343  
  nop                                                                #  212   0xebfbf  1      OPC=1343  
  nop                                                                #  213   0xebfc0  1      OPC=1343  
  nop                                                                #  214   0xebfc1  1      OPC=1343  
  nop                                                                #  215   0xebfc2  1      OPC=1343  
  nop                                                                #  216   0xebfc3  1      OPC=1343  
  nop                                                                #  217   0xebfc4  1      OPC=1343  
  nop                                                                #  218   0xebfc5  1      OPC=1343  
  nop                                                                #  219   0xebfc6  1      OPC=1343  
  nop                                                                #  220   0xebfc7  1      OPC=1343  
  nop                                                                #  221   0xebfc8  1      OPC=1343  
  nop                                                                #  222   0xebfc9  1      OPC=1343  
  nop                                                                #  223   0xebfca  1      OPC=1343  
  nop                                                                #  224   0xebfcb  1      OPC=1343  
  nop                                                                #  225   0xebfcc  1      OPC=1343  
  nop                                                                #  226   0xebfcd  1      OPC=1343  
  callq ._ZNSt13basic_filebufIcSt11char_traitsIcEE13_M_set_bufferEi  #  227   0xebfce  5      OPC=260   
  movl %ebx, %ebx                                                    #  228   0xebfd3  2      OPC=1157  
  movb $0x1, 0x62(%r15,%rbx,1)                                       #  229   0xebfd5  6      OPC=1140  
  jmpq .L_ebf20                                                      #  230   0xebfdb  5      OPC=930   
  nop                                                                #  231   0xebfe0  1      OPC=1343  
  nop                                                                #  232   0xebfe1  1      OPC=1343  
  nop                                                                #  233   0xebfe2  1      OPC=1343  
  nop                                                                #  234   0xebfe3  1      OPC=1343  
  nop                                                                #  235   0xebfe4  1      OPC=1343  
  nop                                                                #  236   0xebfe5  1      OPC=1343  
  nop                                                                #  237   0xebfe6  1      OPC=1343  
  nop                                                                #  238   0xebfe7  1      OPC=1343  
  nop                                                                #  239   0xebfe8  1      OPC=1343  
  nop                                                                #  240   0xebfe9  1      OPC=1343  
  nop                                                                #  241   0xebfea  1      OPC=1343  
  nop                                                                #  242   0xebfeb  1      OPC=1343  
  nop                                                                #  243   0xebfec  1      OPC=1343  
  nop                                                                #  244   0xebfed  1      OPC=1343  
  nop                                                                #  245   0xebfee  1      OPC=1343  
  nop                                                                #  246   0xebfef  1      OPC=1343  
  nop                                                                #  247   0xebff0  1      OPC=1343  
  nop                                                                #  248   0xebff1  1      OPC=1343  
  nop                                                                #  249   0xebff2  1      OPC=1343  
.L_ebfe0:                                                            #        0xebff3  0      OPC=0     
  nop                                                                #  250   0xebff3  1      OPC=1343  
  nop                                                                #  251   0xebff4  1      OPC=1343  
  nop                                                                #  252   0xebff5  1      OPC=1343  
  nop                                                                #  253   0xebff6  1      OPC=1343  
  nop                                                                #  254   0xebff7  1      OPC=1343  
  nop                                                                #  255   0xebff8  1      OPC=1343  
  nop                                                                #  256   0xebff9  1      OPC=1343  
  nop                                                                #  257   0xebffa  1      OPC=1343  
  nop                                                                #  258   0xebffb  1      OPC=1343  
  nop                                                                #  259   0xebffc  1      OPC=1343  
  nop                                                                #  260   0xebffd  1      OPC=1343  
  nop                                                                #  261   0xebffe  1      OPC=1343  
  nop                                                                #  262   0xebfff  1      OPC=1343  
  nop                                                                #  263   0xec000  1      OPC=1343  
  nop                                                                #  264   0xec001  1      OPC=1343  
  nop                                                                #  265   0xec002  1      OPC=1343  
  nop                                                                #  266   0xec003  1      OPC=1343  
  nop                                                                #  267   0xec004  1      OPC=1343  
  nop                                                                #  268   0xec005  1      OPC=1343  
  nop                                                                #  269   0xec006  1      OPC=1343  
  nop                                                                #  270   0xec007  1      OPC=1343  
  nop                                                                #  271   0xec008  1      OPC=1343  
  nop                                                                #  272   0xec009  1      OPC=1343  
  nop                                                                #  273   0xec00a  1      OPC=1343  
  nop                                                                #  274   0xec00b  1      OPC=1343  
  nop                                                                #  275   0xec00c  1      OPC=1343  
  nop                                                                #  276   0xec00d  1      OPC=1343  
  callq ._ZSt16__throw_bad_castv                                     #  277   0xec00e  5      OPC=260   
  cmpq $0xff, %rdx                                                   #  278   0xec013  4      OPC=475   
  movl %eax, %edi                                                    #  279   0xec017  2      OPC=1157  
  je .L_ec020                                                        #  280   0xec019  6      OPC=893   
  nop                                                                #  281   0xec01f  1      OPC=1343  
  nop                                                                #  282   0xec020  1      OPC=1343  
  nop                                                                #  283   0xec021  1      OPC=1343  
  nop                                                                #  284   0xec022  1      OPC=1343  
  nop                                                                #  285   0xec023  1      OPC=1343  
  nop                                                                #  286   0xec024  1      OPC=1343  
  nop                                                                #  287   0xec025  1      OPC=1343  
  nop                                                                #  288   0xec026  1      OPC=1343  
  nop                                                                #  289   0xec027  1      OPC=1343  
  nop                                                                #  290   0xec028  1      OPC=1343  
  nop                                                                #  291   0xec029  1      OPC=1343  
  nop                                                                #  292   0xec02a  1      OPC=1343  
  nop                                                                #  293   0xec02b  1      OPC=1343  
  nop                                                                #  294   0xec02c  1      OPC=1343  
  nop                                                                #  295   0xec02d  1      OPC=1343  
  nop                                                                #  296   0xec02e  1      OPC=1343  
  nop                                                                #  297   0xec02f  1      OPC=1343  
  nop                                                                #  298   0xec030  1      OPC=1343  
  nop                                                                #  299   0xec031  1      OPC=1343  
  nop                                                                #  300   0xec032  1      OPC=1343  
  nop                                                                #  301   0xec033  1      OPC=1343  
  callq ._Unwind_Resume                                              #  302   0xec034  5      OPC=260   
.L_ec020:                                                            #        0xec039  0      OPC=0     
  nop                                                                #  303   0xec039  1      OPC=1343  
  nop                                                                #  304   0xec03a  1      OPC=1343  
  nop                                                                #  305   0xec03b  1      OPC=1343  
  nop                                                                #  306   0xec03c  1      OPC=1343  
  nop                                                                #  307   0xec03d  1      OPC=1343  
  nop                                                                #  308   0xec03e  1      OPC=1343  
  nop                                                                #  309   0xec03f  1      OPC=1343  
  nop                                                                #  310   0xec040  1      OPC=1343  
  nop                                                                #  311   0xec041  1      OPC=1343  
  nop                                                                #  312   0xec042  1      OPC=1343  
  nop                                                                #  313   0xec043  1      OPC=1343  
  nop                                                                #  314   0xec044  1      OPC=1343  
  nop                                                                #  315   0xec045  1      OPC=1343  
  nop                                                                #  316   0xec046  1      OPC=1343  
  nop                                                                #  317   0xec047  1      OPC=1343  
  nop                                                                #  318   0xec048  1      OPC=1343  
  nop                                                                #  319   0xec049  1      OPC=1343  
  nop                                                                #  320   0xec04a  1      OPC=1343  
  nop                                                                #  321   0xec04b  1      OPC=1343  
  nop                                                                #  322   0xec04c  1      OPC=1343  
  nop                                                                #  323   0xec04d  1      OPC=1343  
  nop                                                                #  324   0xec04e  1      OPC=1343  
  nop                                                                #  325   0xec04f  1      OPC=1343  
  nop                                                                #  326   0xec050  1      OPC=1343  
  nop                                                                #  327   0xec051  1      OPC=1343  
  nop                                                                #  328   0xec052  1      OPC=1343  
  nop                                                                #  329   0xec053  1      OPC=1343  
  callq .__cxa_call_unexpected                                       #  330   0xec054  5      OPC=260   
                                                                                                        
.size _ZNSt13basic_filebufIcSt11char_traitsIcEE6xsputnEPKci, .-_ZNSt13basic_filebufIcSt11char_traitsIcEE6xsputnEPKci
