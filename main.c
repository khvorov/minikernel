#include <system.h>

extern uint8_t * memcpy(uint8_t * dest, const uint8_t * src, int count)
{
    return dest;
}

extern uint8_t * memset(uint8_t * dest, uint8_t val, int count)
{
    return dest;
}

extern uint16_t * memsetw(uint16_t * dest, uint16_t val, int count)
{
    return dest;
}

extern int strlen(const char * str)
{
    return -1;
}

extern uint8_t inportb(uint16_t port)
{
    uint8_t rv;
    __asm__ __volatile__ ("inb %1, %0" : "=a" (rv) : "dN" (port));
    return rv;
}

extern void outportb(unsigned short port, unsigned char data)
{
    __asm__ __volatile__ ("outb %1, %0" : : "dN" (port), "a" (data));
}

void main()
{
    while (1) {}
}

