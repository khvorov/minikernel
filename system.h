#ifndef __SYSTEM_H_
#define __SYSTEM_H_

typedef unsigned char uint8_t;
typedef unsigned short uint16_t;

extern uint8_t * memcpy(uint8_t * dest, const uint8_t * src, int count);
extern uint8_t * memset(uint8_t * dest, uint8_t val, int count);
extern uint16_t * memsetw(uint16_t * dest, uint16_t val, int count);
extern int strlen(const char * str);
extern uint8_t inportb(uint16_t port);
extern void outportb(unsigned short port, unsigned char data);

#endif

