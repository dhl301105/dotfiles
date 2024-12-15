#include <stdio.h>

int main() {
  int m, n;
  printf("a[m][n]\n");
  printf("Nhap m, n = ");
  scanf("%d %d", &m, &n);
  int a[m][n];
  for (int i = 0; i < m; i++) {
    for (int j = 0; j < n; j++) {
      printf("Nhap phan tu a[%d][%d] = ", i, j);
      scanf("%d", &a[i][j]);
    }
  }

  printf("Xuat mang: \n");
  for (int i = 0; i < m; i++) {
    for (int j = 0; j < n; j++) {
      printf("Phan tu a[%d][%d] = %d \n", i, j, a[i][j]);
    }
  }

  int max = a[0][0], min = a[0][0];
  for (int i = 0; i < m; i++) {
    for (int j = 0; j < n; j++) {
      if (max < a[i][j]) {
        max = a[i][j];
      }

      if (min > a[i][j]) {
        min = a[i][j];
      }
    }
  }
  printf("So lon nhat: %d \n", max);
  printf("So be nhat: %d \n", min);

  int tong = 0;
  for (int i = 0; i < m; i++) {
    for (int j = 0; j < n; j++) {
      tong = tong + a[i][j];
    }
  }
  printf("Tong: %d \n", tong);
}
