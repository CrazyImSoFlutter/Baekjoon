#include <stdio.h>
#include <string.h>
#define STACK_SIZE 51

typedef struct VPS {
	char buf[STACK_SIZE];
	int top;
}VPS;

void initVPS(VPS *v){
	v->top = -1;
	for (int i = 0; i < STACK_SIZE; i++){
		v->buf[i] = 0;
	}
}

int isEmpty(VPS *v){
	if (v->top == -1)
		return 1;
	else
		return 0;
}

int isFull(VPS *v){
	if (v->top + 1 == STACK_SIZE)
		return 1;
	else
		return 0;
}

void push(VPS *v, char data){
	if (isFull(v) == 0)
		v->buf[v->top++] = data;
	else
		return ;
}

void pop(VPS *v){
	if (isEmpty(v) == 0)
		v->top--;
	else
		return ;
}


int main(){
	char PS[STACK_SIZE];
	int N;
	int length;
	int flag;
	VPS v;

	scanf("%d", &N);
	for (int i = 0; i < N; i++){
		scanf("%s", PS);
		length = strlen(PS);
		flag = 0;
		initVPS(&v);
		if (length % 2 == 1){
			printf("NO\n");
			continue;
		} else {
			for (int j = 0; j < length; j++){
				if (PS[j] == '(')
					push(&v, PS[j]);
				else if (PS[j] == ')'){
					if (isEmpty(&v) == 1){
						printf("NO\n");
						flag = 1;
						break;
					} else {
						pop(&v);
					}
				}
			}
			if (flag == 1)
				continue ;
			if (isEmpty(&v) == 1)
				printf("YES\n");
			else
				printf("NO\n");
		}
	}
}
