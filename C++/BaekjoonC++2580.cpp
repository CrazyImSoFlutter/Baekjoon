#include <cstdio>
#include <cstdlib>

using namespace std;

int sdk[9][9];
int row[9][9];
int col[9][9];
int sqr[9][9];

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

void input() {
    for (int i = 0; i < 9; i++) {
        for (int j = 0; j < 9; j++) {
            get(sdk[i][j]);
            if (sdk[i][j] != 0) {
                row[i][sdk[i][j]] = 1;
                col[j][sdk[i][j]] = 1;
                sqr[(i / 3) * 3 + (j / 3)][sdk[i][j]] = true;
            }
        }
    }
}

void print() {
    for (int i = 0; i < 9; i++) {
        for (int j = 0; j < 9; j++) {
            printf("%d ", sdk[i][j]);
        }
        printf("\n");
    }

}

void dfs(int cnt) {
    int x, y;

    x = cnt / 9;
    y = cnt % 9;

    if (cnt == 81) {
        print();
        exit(0);
    }
    if (sdk[x][y] == 0) {
        for (int i = 1; i <= 9; i++) {
            if (row[x][i] == 0 && col[y][i] == 0 && sqr[(x / 3) * 3 + (y / 3)][i] == 0) {
                row[x][i] = 1;
                col[y][i] = 1;
                sqr[(x / 3) * 3 + (y / 3)][i] = 1;
                sdk[x][y] = i;
                dfs(cnt + 1);
                sdk[x][y] = 0;
                row[x][i] = 0;
                col[y][i] = 0;
                sqr[(x / 3) * 3 + (y / 3)][i] = 0;
            }
        }
    } else
        dfs(cnt + 1);
}

void solve() {
    input();
    dfs(0);
}

int main() {
    solve();
}
