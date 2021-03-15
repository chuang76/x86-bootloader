# x86-bootloader

The project is an experimental x86 [bootloader](https://en.wikipedia.org/wiki/Booting) (i386) for the learning purpose. Bootloader is a piece of program that runs before the operating system when a computer is turned on. Its primary goal is to ready the system for control by the kernel. The project is implemented in 5 labs and emulated with [QEMU](https://www.qemu.org/), which is a powerful machine emulator and virtualizer. 

- [x] Print a string and hex bytes (not just ASCII characters) in 16-bit real mode with BIOS interrupt call (int 0x10)
- [x] Understand the concepts of stack and function calls
- [x] Understand the memory addressing of 8086/80286/80386: segmentation and flat model 
- [x] Load data from disk with BIOS interrupt call (int 0x13)
- [x] Implement the global descriptor table (GDT) structure 
- [x] Switch to 32-bit protected mode: disable interrupt, load GDT, enable PE flag in CR0, flush pipeline
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

- If you want to debug the code, you can connect to gdb remotely with the port 1234

  ```
  (gdb) target remote localhost:1234
  ```

  

## Result

The program first prints a string in 16-bit real mode with BIOS interrupt call. Then prepare to load the kernel from the disk and switch to 32-bit protected mode. Finally, it lands on 32-bit protected mode and loads the kernel. As you can see, the program executes the function that is located in the kernel. That is, print 'X' with video memory successfully. 

<img src="https://github.com/chuang76/x86-bootloader/blob/main/figure/demo-2.png?raw=true" width="600" height="400">
