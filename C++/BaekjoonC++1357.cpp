#include <iostream>
#include <string>
#include <algorithm>
#include <sstream>
#include <vector>

using namespace std;

int main() {
    string X, Y;
    int x, tmpx, tmpy;
    int flag;
    vector<int> answer;

    cin >> X >> Y;
    reverse(X.begin(), X.end());
    reverse(Y.begin(), Y.end());
    stringstream tmpX(X);
    stringstream tmpY(Y);
    tmpX >> tmpx;
    tmpY >> tmpy;
    x = tmpx + tmpy;
    flag = 1;
    while (x) {
        if (flag == 1 && x % 10 == 0) {
            x /= 10;
            continue;
        } else if (flag == 0 && x % 10 == 0){
            answer.push_back(x % 10);
            x /= 10;
            continue;
        }
        if (x % 10 != 0) {
            flag = 0;
            answer.push_back(x % 10);
            x /= 10;
        }
    }
    for (int i = 0; i < answer.size(); i++)
        cout << answer[i];
}
