#include <iostream>
#include <vector>
#include <cmath>

using namespace std;

int N, M, prv, tmp, maxVal;
vector<int> L;

int main() {
    cin >> N >> M;

    for (int i = 0; i < M; i++) {
        cin >> tmp;

        if (i == 0)
            maxVal = (maxVal < tmp - prv) ? tmp - prv : maxVal;
        else
            maxVal = (maxVal < ceil(double(tmp - prv) / 2)) ? ceil(double(tmp - prv) / 2) : maxVal;
        prv = tmp;
    }
    maxVal = (maxVal < N - prv) ? N - prv : maxVal;
    cout << maxVal;
}