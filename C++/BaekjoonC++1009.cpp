#include <cstdio>

using namespace std;

int main() {
    int t, a, b, r;

    scanf("%d", &t);
    while(t--) {
        scanf("%d %d", &a, &b);
        r = a;
        b = b % 4 + 4;
        for (int i = 2; i <= b; i++)
            r = (r * a) % 10;
        if (r == 0)
            r = 10;
        printf("%d\n", r);
    }
    return 0;
}
