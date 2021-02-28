all:	run clean 

boot.bin: print_str2.S
	nasm $< -f bin -o $@

run: boot.bin
	qemu-system-i386 -fda boot.bin
clean:
	rm boot.bin
