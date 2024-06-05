#include <iostream>
#include <vector>

using namespace std;

int N, S;
int switches[101];
vector<int> boys;
vector<int> girls;

int main() {
    cin >> N;

    for (int i = 1; i <= N; i++) {
        cin >> switches[i];
    }
    
    cin >> S;
    for (int i = 0; i < S; i++) {
        int gender, number;

        cin >> gender >> number;

        if (gender == 1) {
            int multiply = 1;

            while(number * multiply <= N) {
                switches[number * multiply] ^= 1;
                multiply++;
            }
        } else {
            int add = 1;
            int leftRange = number;
            int rightRange = number;

            while (number - add > 0 && number + add <= N) {
                if (switches[number - add] == switches[number + add]) {
                    leftRange = number - add;
                    rightRange = number + add;
                    add++;
                } else {
                    break;
                }
            }

            for (int i = leftRange; i <= rightRange; i++) {
                switches[i] ^= 1;
            }
        }
    }

    int count = 0;
    for (int i = 1; i <= N; i++) {
        cout << switches[i];
        count++;
        if (count == 20) {
            cout << "\n";
            count = 0;
        } else {
            cout << " ";
        }
    }
}