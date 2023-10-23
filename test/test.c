#include <stdio.h>

int a();
int b(int b1, int b2, int b3, int b4, int b5);
void c();

int a(){
 int res;
 res = b(1,2,3,4,5);
 c();
 res = b(1,2,3,4,6);
 return res;
}

int b(int b1, int b2, int b3, int b4, int b5){
 int res = b1+ b2+ b3+ b4+ b5;
 c();
 return res;
}

void c(){
 int i=0;
}

int main(){
 int res = a();
 printf("%d\n", res);
}
