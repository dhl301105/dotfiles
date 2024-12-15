#include <stdio.h>

char *my_strcat(char *des, char *src) {
  char *rdes = des;
  while (*des) {
    des++;
  }
  while (*des++ = *src++) {
  }
  return rdes;
}

int main(int argc, char *argv[]) {
  char str1[100] = "hello ", str2[100] = "ok";
  my_strcat(str1, str2);
  printf("%s", str1);
}
