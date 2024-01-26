#include <iostream>

using namespace std;

int N, M;

int package = 987654321;
int peace = 987654321;
int answer;

bool compare (int a, int b){
    return a > b;
}

int main() {
    cin >> N >> M;

    for (int i = 0; i < M; i++) {
        int a, b;

        cin >> a >> b;

        if (package > a) package = a;
        if (peace > b) peace = b;
    }

    if (N >= 6) {
        if (package <= peace * 6) {
            answer += package * (N / 6);
            if (package <= peace * (N % 6)) answer += package;
            else answer += peace * (N % 6);
        } else {
            answer = peace * N;
        }
    } else {
        if (package <= peace * 6) {
            answer = package;
        } else {
            answer = peace * N;
        }
    }

    cout << answer;
}