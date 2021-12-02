#include <stdio.h>

using namespace std;

int prime[246913];

inline void get(int& x) {
	int c = getchar_unlocked();

	x = 0;
	int neg = 0;
	for (; ((c < 48 || c > 57) && c != '-'); c = getchar_unlocked());
	if (c == '-') {
		neg = 1;
		c = getchar_unlocked();
	}
	for (; c > 47 && c < 58; c = getchar_unlocked()) {
		x = (x << 1) + (x << 3) + c - 48;
	}
	if (neg)
		x = -x;
}

void prime_num() {
    prime[0] = 1;
    prime[1] = 1;
    for (int i = 2; i < 246913; i++)
        for (int j = i * 2; j < 246913; j += i)
            prime[j] = 1;
}

int how_many_prime(int a) {
    int num = 0;

    for (int i = 1; i <= a; i++)
        if (prime[i] == 0)
            num += 1;
    return num;
}

int main() {
    prime_num();
    while (true) {
        int n, m;

        get(m);
        n = m * 2;
        if (m == 0)
            break;
        printf("%d\n", how_many_prime(n) - how_many_prime(m));
    }
}
