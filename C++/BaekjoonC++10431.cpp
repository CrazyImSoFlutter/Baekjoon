#include <iostream>

using namespace std;

int T;
int num[20];

int main() {
    cin >> T;

    while (T--) {
        int caseNumber = 0;
        int count = 0;
        cin >> caseNumber;

        for (int i = 0; i < 20; i++) {
            cin >> num[i];

            for (int j = 0; j <= i; j++) {
                if (num[j] > num[i]) {
                    count += (i - j);
                    break;
                }
            }
        }
        cout << caseNumber<< " " << count << endl;
    }
}