#include <iostream>
using namespace std;

int N, dasom, answer, arr[50];

int main() {
    cin >> N >> dasom;
    for (int i = 0; i < N - 1; i++) cin >> arr[i];

    while (true) {
        int max = 0;
        int index;

        for (int i = 0; i < N; i++) {
            if (max < arr[i]) {
                max = arr[i];
                index = i;
            }
        }
        if (dasom > max) {
            cout << answer << '\n';
            break;
        }
        dasom++;
        arr[index]--;
        answer++;
    }    
}