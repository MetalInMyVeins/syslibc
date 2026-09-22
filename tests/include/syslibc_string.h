#ifndef SYSLIBC_STRING_H
#define SYSLIBC_STRING_H

#ifdef __cplusplus
extern "C" {
#endif

#include "syslibc_stddef.h"

size_t syslibc_strlen(const char*);
void* syslibc_memset(void*, int, size_t);

#ifdef __cplusplus
}
#endif

#endif // SYSLIBC_STRING_H
