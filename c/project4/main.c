#include <stdatomic.h>
#include <stddef.h>
#include <stdio.h>
#include <string.h>

struct SinhVien {
  char ho_va_ten[100];
  int tuoi;
  int diem_trung_binh;
};

void xoaXuongDong(char x[]) {
  size_t len = strlen(x);
  if (x[len - 1] == '\n') {
    x[len - 1] = '\0';
  }
}

int main(int argc, char const *argv[]) {
  int m;
  printf("Nhập số sinh viên: ");
  scanf("%d", &m);
  printf("\n");
  struct SinhVien sinhvien[100];
  for (int i = 0; i < m; i++) {
    printf("Sinh viên %d\n", i + 1);
    printf("Nhập họ và tên: ");
    getchar();
    // fflush(stdin);
    fgets(sinhvien[i].ho_va_ten, sizeof(sinhvien[i].ho_va_ten), stdin);
    xoaXuongDong(sinhvien[i].ho_va_ten);
    printf("Nhập tuổi: ");
    scanf("%d", &sinhvien[i].tuoi);
    printf("Nhập điểm trung bình: ");
    scanf("%d", &sinhvien[i].diem_trung_binh);
    printf("\n");
  }

  char ho_va_ten[100];
  printf("Nhập họ và tên cần tìm: ");
  getchar();
  fgets(ho_va_ten, sizeof(ho_va_ten), stdin);
  xoaXuongDong(ho_va_ten);
  for (int i = 0; i < m; i++) {
    if (strcmp(ho_va_ten, sinhvien[i].ho_va_ten) == 0) {
      printf("Tồn tại");
      break;
    };
  }
}
