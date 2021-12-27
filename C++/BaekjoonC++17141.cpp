#include <cstdio>
#include <queue>
#include <utility>
#include <vector>

using namespace std;

int N, M;
int lab[50][50];
bool visit[50][50];
int dy[] = {-1, 1, 0, 0};
int dx[] = {0, 0, -1, 1};
vector<pair<int, int> > S;
vector<pair<int, int> > S_V;
bool select[10];
int answer;

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
    get(N); get(M);
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            get(lab[i][j]);
            if (lab[i][j] == 2) {
                S.push_back({i, j});
                lab[i][j] = 0;
            }
        }
    }
    answer = 2100000000;
}

void init() {
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            visit[i][j] = 0;
        }
    }
}

bool check() {
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            if (lab[i][j] == 1)
                continue;
            if (visit[i][j] == 0)
                return false;
        }
    }
    return true;
}

void bfs() {
    queue<pair<int, int> > Q;
    int y, x, cnt;

    for (int i = 0; i < S_V.size(); i++) {
        y = S_V[i].first;
        x = S_V[i].second;
        Q.push({y, x});
        visit[y][x] = 1;
    }
    cnt = 0;
    while(Q.empty() == 0) {
        int size;
        size = Q.size();
        for (int i = 0; i < size; i++) {
            y = Q.front().first;
            x = Q.front().second;
            Q.pop();
            for (int i = 0; i < 4; i++) {
                int Y, X;

                Y = y + dy[i];
                X = x + dx[i];
                if (Y < 0 || Y >= N || X < 0 || X >= N)
                    continue;
                if (visit[Y][X] == 0 && lab[Y][X] != 1) {
                    Q.push({Y, X});
                    visit[Y][X] = 1;
                }
            }
        }
        if (Q.size() != 0)
            cnt++;
    }
    if (check() == 1)
        answer = answer < cnt ? answer : cnt;
}

void select_V(int index, int depth) {
    if (depth == M) {
        init();
        bfs();
        return;
    }
    for (int i = index; i < S.size(); i++) {
        if (select[i] == 1)
            continue;
        select[i] = 1;
        S_V.push_back(S[i]);
        select_V(i, depth + 1);
        S_V.pop_back();
        select[i] = 0;
    }
}

void solution() {
    select_V(0, 0);
    if (answer == 2100000000)
        answer = -1;
    printf("%d\n", answer);
}

void solve() {
    input();
    solution();
}

int main() {
    solve();
}
