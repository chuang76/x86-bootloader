# x86-bootloader

The project is an experimental x86 [bootloader](https://en.wikipedia.org/wiki/Booting) (i386) for the learning purpose. Bootloader is a program that runs before the operating system. It loads the kernel when a computer is turned on. The project is implemented 5 labs and emulated with [QEMU](https://www.qemu.org/) emulator.  

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

Install QEMU emulator in Kali Linux

```
$ sudo apt-get install qemu-system-x86
```

Instructions to run Lab05:

![](https://github.com/chuang76/x86-bootloader/blob/main/figure/demo-1.PNG?raw=true)

- Compile the assembly code into binary 

  ```
  $ nasm boot.asm -f bin -o boot.bin
  ```

- Compile the files about kernel and link object files into binary 

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



## Result

We first print a string in 16-bit real mode with BIOS interrupt routine. Then prepare to load kernel from disk and switch to 32-bit protected mode. Finally, we land on 32-bit protected mode and load the kernel. As you can see, we print 'X' successfully which is located in the function of kernel. 

![](https://github.com/chuang76/x86-bootloader/blob/main/figure/demo-2.png?raw=true)