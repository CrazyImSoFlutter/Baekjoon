#include <stdio.h>
#define STACK_MAX 10001

typedef struct Stack
{
	int buf[STACK_MAX];
	int top;
}Stack;

void InitStack(Stack *stack)
{
	stack->top = -1;
}

int IsFull(Stack *stack)
{
	return (stack->top + 1) ==  STACK_MAX;
}

int IsEmpty(Stack *stack)
{
	return stack->top == -1;
}

void push(Stack *stack, int data)
{
	if (IsFull(stack))
	{
		return ;
	}
	(stack->top)++;
	stack->buf[stack->top] = data;
}

int pop(Stack *stack)
{
	int re = 0;
	if (IsEmpty(stack))
	{
		return -1;
	}
	re = stack->buf[stack->top];
	stack->top--;
	return re;
}

int main ()
{
	int N;
	int data;
	char input[100];
	Stack stack;

	scanf("%d", &N);
	InitStack(&stack);
	while(N--)
	{
		scanf("%s", input);
		if (input[0] == 'p' && input[1] == 'u')
		{
			scanf("%d", &data);
			push(&stack, data);
		}
		else if (input[0] == 'p'&& input[1] == 'o')
		{
			printf("%d\n", pop(&stack));
		}
		else if (input[0] == 's')
		{
			printf("%d\n", stack.top + 1);
		}
		else if (input[0] == 'e')
		{
			if (IsEmpty(&stack))
				printf("1\n");
			else
				printf("0\n");
		}
		else if (input[0] == 't')
		{
			if (IsEmpty(&stack))
				printf("-1\n");
			else
				printf("%d\n", stack.buf[stack.top]);
		}
	}
}
