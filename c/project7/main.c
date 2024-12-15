#include <stdio.h>
#include <string.h> /* size_t memcmp() strlen() */

int my_memcmp(const void *_first, const void *_second, size_t sz) {
  const unsigned char *first = _first, *second = _second;

  while (sz--) {
    int cmp = *first++ - *second++;
    if (cmp == 0)
      continue;
    return cmp;
  }
  return 0;
}

char *my_strstr(const char *s1, const char *s2) {
  size_t n = strlen(s2);
  while (*s1)
    if (!my_memcmp(s1++, s2, n))
      return (char *)(s1 - 1);
  return 0;
}

int main(int argc, char *argv[]) {
  char str1[100] = "hello ok", str2[100] = "oxok";
  printf("%s", my_strstr(str1, str2));
}
