#include <iostream>

using namespace std;

int main() {
    int n, m, result[100000];
    char a[50000], b[50000];
    bool flag;

    cin >> n >> m;
    cin >> a >> b;
    for (int i = 0; i < m; i++) {
        for (int j = 0; j < n; j++) {
            int tmp = (a[n - j - 1] - '0') * (b[m - i - 1] - '0');
            result[n + m - i - j - 1] += tmp;
        }
    }

    for (int i = n + m - 1; i > 0; i--) {
        result[i - 1] += result[i] / 10;
        result[i] %= 10;
    }
    flag = false;
    for (int i = 0; i < n + m; i++) {
        if (!flag) {
            if (result[i] != 0)
                flag = true;
            else if (i == n + m - 1)
                cout << "0";
        }
        if (flag)
            cout << result[i];
    }
    return 0;
}
