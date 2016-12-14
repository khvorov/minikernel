[BITS 32]

global start

start:
    mov esp, _sys_stack
    jmp stublet

; align it
ALIGN 4
mboot:
    MULTIBOOT_PAGE_ALIGN    equ 1 << 0
    MULTIBOOT_MEMORY_INFO   equ 1 << 1
    MULTIBOOT_AOUT_KLUDGE   equ 1 << 16
    MULTIBOOT_HEADER_MAGIC  equ 0x1BADB002
    MULTIBOOT_HEADER_FLAGS  equ MULTIBOOT_PAGE_ALIGN | MULTIBOOT_MEMORY_INFO | MULTIBOOT_AOUT_KLUDGE
    MULTIBOOT_CHECKSUM      equ -(MULTIBOOT_HEADER_MAGIC + MULTIBOOT_HEADER_FLAGS)

    EXTERN code, bss, end

    ; GRUB multiboot header
    dd MULTIBOOT_HEADER_MAGIC
    dd MULTIBOOT_HEADER_FLAGS
    dd MULTIBOOT_CHECKSUM

    ; The linker script fills in the data for these ones
    dd mboot
    dd code
    dd bss
    dd end
    dd start

; later we will insert a call to main
stublet:
    extern main
    call main
    jmp $

; definition of BSS here
; stack is stored here
SECTION .bss
    resb 8192
_sys_stack:

