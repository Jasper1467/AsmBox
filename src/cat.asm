global _start

section .text

; https://blog.rchapman.org/posts/Linux_System_Call_Table_for_x86_64/

_start:
  mov rax, 2 ; sys_open
  mov rdi, [rsp+16] ; rsp + 16 = First argument (which should be the file's path)
  mov rsi, 0 ; specify read only
  mov rdx, 0
  syscall
  mov rsi, rax 
  mov rdi, 1 ; output the file to stdout. (1 is the file description number of stdout)
  mov rax, 40 ; sys_sendfile
  mov rdx, 0
  mov r10, 256 ; transfer 0-255 bytes, this also means files greater than this aren't supported
  syscall
  mov rax, 60 ; sys_exit
  syscall
