#include <iostream>

using namespace std;

int n;
int tree[26][2];

void preorder(int x) {
    if (x < 0)
        return ;
    
    cout << (char)(x + 65);
    preorder(tree[x][0]);
    preorder(tree[x][1]);
}

void inorder(int x) {
    if (x < 0)
        return ;
    
    inorder(tree[x][0]);
    cout << (char)(x + 65);
    inorder(tree[x][1]);
}

void postorder(int x) {
    if (x < 0)
        return ;
    postorder(tree[x][0]);
    postorder(tree[x][1]);
    cout << (char)(x + 65);
}

void input() {
    char a, b, c;

    cin >> n;
    for (int i = 0; i < n; i++) {
        cin >> a >> b >> c;

        tree[a - 65][0] = b - 65;
        tree[a - 65][1] = c - 65;
    }
}

void solution() {
    preorder(0);
    cout << '\n';
    inorder(0);
    cout << '\n';
    postorder(0);
    cout << '\n';
}

void solve() {
    input();
    solution();
}

int main() {
    solve();
}