#include <stdio.h>
#include <stdlib.h>
#define NEXT(index, qsize) ((index + 1) % qsize)
#define QUEUE_SIZE 500001
typedef struct card{
	int buf[QUEUE_SIZE];
	int top;
	int back;
}card;

void initCard(card *c, int N){
	c->top = 0;
	c->back = N - 1;
}

void discard(card *c){
	c->top = NEXT(c->top, QUEUE_SIZE);
}

void goBack(card *c){
	c->back = NEXT(c->back, QUEUE_SIZE);
	c->buf[c->back] = c->buf[c->top];
	c->top = NEXT(c->top, QUEUE_SIZE);
}

int main () {
	int N;
	int M;
	card c;
	
	scanf("%d", &N);
	initCard(&c, N);
	for (int i = 0; i < N; i++){
		c.buf[i] = i + 1;
	}
	while (c.back != c.top){
		discard(&c);
		goBack(&c);
	}
	printf("%d", c.buf[c.top]);
}
