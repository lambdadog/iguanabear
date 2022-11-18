#ifndef IGUANABEAR_LIBC_SHIM
#define IGUANABEAR_LIBC_SHIM

/* ----- */

// FIXME: figure out a better way to do this. Ideally it could just
// use Zig's usize somehow... not sure how though
#if defined(WIN32) || defined(_WIN32) || defined(__WIN32__) || defined(__NT__)
typedef long long ssize_t;
typedef unsigned long long size_t;
#else
typedef long ssize_t;
typedef unsigned long size_t;
#endif // WIN32

/* ----- */

void *memcpy(void *s1, const void *s2, size_t n);
void *memset(void *s, int c, size_t n);
void *memmove(void *s1, const void *s2, size_t n);
int memcmp(const void *s1, const void *s2, size_t n);
size_t strlen(const char *s);

/* ----- */

typedef size_t time_t;

time_t time(time_t *t);

/* ----- */

#endif // IGUANABEAR_LIBC_SHIM
