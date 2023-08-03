#include <stdio.h>

int main() {
    int arr[3000010];
    int top = 1000000, bot = 1000000;
    int com;
    int N;
    scanf("%d", &N);
    for (size_t i = 0; i < N; i++)
    {
        scanf("%d", &com);
        if (com == 1) scanf("%d", &arr[--top]);
        else if (com == 2) scanf("%d", &arr[bot++]);
        else if (com == 3) printf("%d\n", bot - top ? arr[top++] : -1);
        else if (com == 4) printf("%d\n", bot - top ? arr[--bot] : -1);
        else if (com == 5) printf("%d\n", bot - top);
        else if (com == 6) printf("%d\n", bot - top ? 0 : 1);
        else if (com == 7) printf("%d\n", bot - top ? arr[top] : -1);
        else if (com == 8) printf("%d\n", bot - top ? arr[bot - 1] : -1);
    }
    return 0;
}
