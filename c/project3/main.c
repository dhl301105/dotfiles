#include <stdatomic.h>
#include <stdio.h>

int main(int argc, char *argv[]) {
  char test[100];
  printf("Nhập chuỗi có khoảng trắng: ");
  //          v   ở đây không có ký tự & vì test là con trỏ
  scanf("%s", test);
  printf("%s", test);
  //       ^      ở đây là %s, dùng %s khi char test[100]
}
