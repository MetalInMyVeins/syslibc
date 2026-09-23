#ifndef SYSLIBC_SYS_PARAM_H
#define SYSLIBC_SYS_PARAM_H

#ifdef __cplusplus
extern "C" {
#endif

#define SYSLIBC_MIN(a, b) ((a) < (b) ? (a) : (b))
#define SYSLIBC_MAX(a, b) ((a) > (b) ? (a) : (b))

#ifdef __cplusplus
}
#endif

#endif // SYSLIBC_SYS_PARAM_H
