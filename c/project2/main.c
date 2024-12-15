#include<stdio.h>

int main()
{	int m,n,i,j;
	printf("nhap so hang so cot:");
	scanf("%d%d",&m,&n);
	int A[m][n];
	for( i=0;i<m;i++)
	{
		for(j=0;j<n;j++){
		printf("A[%d][%d]=",i,j);
		scanf("%d",&A[i][j]);
	}
}
	printf("Mang vua nhap:");
	for( i=0;i<m ;i++)
	{
		for(j=0;j<n;j++){
		printf("A[%d][%d]=%d\n",i,j,A[i][j]);
	}
	printf("\n");
}


	int max;
	max=A[0][0];
	for(i=0;i<m;i++){
		for(j=0;j<n;j++){
			if(max<A[i][j])
				max=A[i][j];
		}
	}
	printf("Gia tri lon nhat trong mang:%d",max);
	printf("\n");
	
	int min;
	min=A[0][0];
	for(i=0;i<m;i++){
		for(j=0;j<n;j++){
			if(min>A[i][j])
				min=A[i][j];
		}
	}
	printf("Gia tri nho nhat trong mang:%d",min);
	
	int Tong;
	Tong = 0;
	for(i=0;i<m;i++){
		for(j=0;j<n;j++){
				Tong=Tong+A[i][j];
		}
	}
	printf("Tong gia tri cua mang la: %d",Tong);
}