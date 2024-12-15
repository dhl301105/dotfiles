#include <stdio.h>

char *my_strcat(char *dest, const char *src) {
  // Chuẩn quy định strcat() trả về dest.
  // Điều đó khá vô dụng (trả về một con trỏ đến
  // *cuối* của dest sẽ tốt hơn), nhưng đó là
  // cách thức hoạt động.
  // Vì chúng ta lặp lại dest như một phần của quá trình triển khai,
  // chúng ta cần "ghi nhớ" giá trị ban đầu của nó.
  char *rdest = dest;

  // Lặp lại các ký tự được trỏ đến bởi dest cho đến khi
  // chúng tôi tìm thấy phần kết thúc (ký tự kết thúc byte null), là "false"
  while (*dest)
    dest++;

  // Một phép gán sẽ đánh giá thành giá trị được gán. Vì vậy, việc gán
  // từng ký tự một (*dest = *src) cuối cùng sẽ
  // đánh giá thành false khi chúng ta gán ký tự kết thúc byte null
  // từ src (tình cờ cũng kết thúc dest). Vì chúng ta
  // tăng hậu tố cho cả hai con trỏ trong quá trình gán, chúng ta
  // không cần bất kỳ phần thân thực tế nào cho vòng lặp.
  while (*dest++ = *src++)
    ;

  // Trả về giá trị đích ban đầu đã "ghi nhớ".
  return rdest;
}

int main(int argc, char *argv[]) {
  char str1[100] = "hello ", str2[100] = "ok";
  my_strcat(str1, str2);
  printf("%s", str1);
}
