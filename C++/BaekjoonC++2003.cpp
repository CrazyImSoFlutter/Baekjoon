#include <iostream>

using namespace std;

int N, M, result, cnt, A[10001];

int main() {
    cin >> N >> M;

    for(int i = 0; i < N; i++) {
        cin >> A[i];
    }

    for(int i = 0; i < N; i++) {
        for(int j = i; j < N; j++) {
            result += A[j];

            if(result == M) {
                cnt++;
                result = 0;
                break;
            }
        }
        if(result != 0) 
            result = 0;
    }   
    cout<< cnt;
}