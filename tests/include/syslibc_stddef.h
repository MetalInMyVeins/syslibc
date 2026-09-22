#ifndef SYSLIBC_STDDEF_H
#define SYSLIBC_STDDEF_H

#if !defined(__x86_64__) || !defined(__linux__)
#error "syslibc: Supported platform: x86_64 Linux (SYSV)"
#endif

static_assert(sizeof(unsigned long) == 8, "syslibc: LP64 target required");

typedef unsigned long size_t;

#endif // SYSLIBC_STDDEF_H
