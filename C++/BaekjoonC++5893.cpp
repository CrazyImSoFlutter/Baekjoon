#include <iostream>
#include <string>
#include <algorithm>

using namespace std;

int main() {
    string N, tmp, A;
    int t;

    cin >> N;
    tmp = N;
    tmp += "0000";
    t = 0;
    while (N.empty() == 0) {
        int val;

        val = N.back() + tmp.back() - 48 * 2 + t;
        t = val / 2;
        A += to_string(val % 2);
        N.pop_back();
        tmp.pop_back();
    }
    while (tmp.empty() == 0) {
        int val;

        val = tmp.back() - 48 + t;
        t = val / 2;
        A += to_string(val % 2);
        tmp.pop_back();
    }
    if (t)
        A += "1";
    reverse(A.begin(), A.end());
    cout << A;
}
