#include <stdio.h>
#include <stdlib.h> 
#include <klee/klee.h>

int main() { 
	int a; 
	klee_make_symbolic(&a,sizeof(a),"a"); 
	if (a < 40 ) 
		printf("Hello\n") ;
	else 
		printf("Hii\n") ;
	return 0 ;
}
