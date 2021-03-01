# x86-bootloader

An experimental x86 [bootloader](https://en.wikipedia.org/wiki/Booting) (i386) for the learning purpose. The project is implemented in 5 labs and emulated with [QEMU](https://www.qemu.org/) emulator.  

- [x] Print a string in 16-bit real mode with BIOS routine (int 0x10)
- [x] Print hex bytes, not just ASCII characters
- [x] Understand the concepts of stack and function calls
- [x] Understand the concept of memory addressing: segmentation
- [x] Load data from disk with BIOS routine (int 0x13)
- [x] Implement the global descriptor table (GDT) structure 
- [x] Switch to the 32-bit protected mode: disable interrupt, enable PE flag in CR0, flush pipeline, etc
- [x] Print a string in 32-bit protected mode with video memory (VGA)
- [x] Load the kernel 



## Usage

Instructions to run Lab05:

- Compile the assembly code into binary 

  ```
  $ nasm boot.asm -f bin -o boot.bin
  ```

- Compile the files about kernel and link intro binary 

  ```
  $ nasm kernel_entry.asm -f elf -o kernel_entry.o
  $ gcc -m32 -fno-pie -ffreestanding -c kernel.c -o kernel.o
  $ ld -m elf_i386 -s -o kernel.bin -Ttext 0x1000 kernel_entry.o kernel.o --oformat binary 
  ```

- Concatenate two binary files into one image 

  ```
  $ cat boot.bin kernel.bin > bootloader
  ```

- Boot QEMU off a floppy disk

  ```
  $ qemu-system-i386 -fda bootloader
  ```

- Or you can run the project simply with make command 

  ```
  $ make
  ```

