#include <stdio.h>
#define QUEUE_SIZE 2000001
#define NEXT(index, QSIZE) ((index + 1) % QSIZE)
typedef struct Queue{
	int buf[QUEUE_SIZE];
	int qsize;
	int front;
	int rear;
	int count;
}Queue;

void InitQueue(Queue *q){
	q->qsize = QUEUE_SIZE;
	q->rear = -1;
	q->front = 0;
	q->count = 0;
}

int IsFull(Queue *q){
	return q->count == q->qsize;
}

int IsEmpty(Queue *q){
	return q->count == 0;
}

void push(Queue *q, int item){
	if (IsFull(q)){
		return ;
	}
	q->rear = NEXT(q->rear, q->qsize);
	q->buf[q->rear] = item;
	q->count++;
}

int pop(Queue *q){
	int re = 0;
	if (IsEmpty(q)){
		return -1;
	}
	re = q->buf[q->front];
	q->front = NEXT(q->front, q->qsize);
	q->count--;
	return re;
}

int main ()
{
	int N;
	int data;
	char input[100];
	Queue queue;

	scanf("%d", &N);
	InitQueue(&queue);
	while(N--) {
		scanf("%s", input);
		if (input[0] == 'p' && input[1] == 'u'){
			scanf("%d", &data);
			push(&queue, data);
		} else if (input[0] == 'p'&& input[1] == 'o'){
			printf("%d\n", pop(&queue));
		} else if (input[0] == 's'){
			printf("%d\n", queue.count);
		} else if (input[0] == 'e'){
			if (IsEmpty(&queue))
				printf("1\n");
			else
				printf("0\n");
		} else if (input[0] == 'f'){
			if (IsEmpty(&queue))
				printf("-1\n");
			else
				printf("%d\n", queue.buf[queue.front]);
		} else if (input[0] == 'b') {
			if (IsEmpty(&queue))
				printf("-1\n");
			else
				printf("%d\n", queue.buf[queue.rear]);
		}
	}
}
