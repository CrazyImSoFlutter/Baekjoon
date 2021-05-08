#include <stdio.h>
#define STACK_SIZE 100001

typedef struct stack{
	int data[STACK_SIZE];
	int top;
}stack;

void initStack(stack *t){
	t->top = -1;
}

int isFull(stack *t){
	return (t->top + 1) == STACK_SIZE;
}

int isEmpty(stack *t){
	return t->top == -1;
}

void push(stack *t, int data){
	if (isFull(t)){
		return ;
	}
	t->top++;
	t->data[t->top] = data;
}

int pop(stack *t){
	int re = 0;

	if (isEmpty(t)){
		return 0;
	}
	re = t->data[t->top];
	t->top--;
	return re;
}

int main() {
	stack T;
	int N;
	int data;
	long long sum = 0;

	initStack(&T);
	scanf("%d", &N);
	for (int i = 0; i < N; i++){
		scanf("%d", &data);
		if (data == 0)
			data = pop(&T);
		else
			push(&T, data);
	}
	for (int i = T.top; i >= 0; i--){
		sum += T.data[i];
	}
	printf("%lld", sum);
}
