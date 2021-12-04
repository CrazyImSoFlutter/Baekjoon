#include <stdio.h>

using namespace std;

int N;
int visit[29][29];
int dy[] = {0, 0, 1, -1};
int dx[] = {-1, 1, 0, 0};
double possibility[4];
double answer;

void dfs(int y, int x, double per) {
    if (N == 0) {
        answer += per;
        return ;
    }
    visit[y][x] = 1;
    for (int i = 0; i < 4; i++) {
        int yp = y + dy[i];
        int xp = x + dx[i];

        if (!visit[yp][xp]) {
            N -= 1;
            dfs(yp, xp, per * possibility[i]);
            N += 1;
            visit[yp][xp] = 0;
        }
    }
}

void input_init() {
    scanf("%d", &N);
    for (int i = 0; i < 4; i++) {
        double tmp;

        scanf("%lf", &tmp);
        possibility[i] = tmp * 0.01;
    }
}

void solution() {
    input_init();
    dfs(14, 14, 1.0);
    printf("%.15lf", answer);
}

int main() {
    solution();
}
