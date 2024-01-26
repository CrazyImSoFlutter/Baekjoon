#include <iostream>
using namespace std;
 
int N, K, answer;
int gold[1001];
int silver[1001];
int bronze[1001];
 
int main() {
    cin >> N >> K;
    for (int i = 0; i < N; i++) {
        int index;
        
        cin >> index;
        cin >> gold[index] >> silver[index] >> bronze[index];
    }
 
    for (int i = 1; i <= N; i++) {
        if (gold[i] > gold[K]) {
            answer++;
        }
        else if (gold[i] == gold[K]) {
            if (silver[i] > silver[K]) {
                answer++;
            }
            else if (silver[i] == silver[K]) {
                if (bronze[i] > bronze[K]) {
                    answer++;
                }
            }
        }
    }
 
    cout << answer + 1;
}
