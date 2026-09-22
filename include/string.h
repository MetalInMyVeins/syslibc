#ifndef STRING_H
#define STRING_H

#ifdef __cplusplus
extern "C" {
#endif

#include "stddef.h"

size_t strlen(const char*);
void* memset(void*, int, size_t);

#ifdef __cplusplus
}
#endif

#endif // STRING_H
