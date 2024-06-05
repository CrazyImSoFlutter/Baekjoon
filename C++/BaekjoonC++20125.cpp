#include <iostream>
#include <vector>

using namespace std;

int N;
vector<string> cookie;
int heartColumn;
int heartRow;
int leftArm;
int rightArm;
int waist;
int leftLeg;
int rightLeg;
bool heartFlag = false;

int main() {
    cin >> N;

    for (int i = 0; i < N; i++) {
        string tmp;

        cin >> tmp;
        cookie.push_back(tmp);
        for (int j = 0; j < N; j++) {
            if (heartFlag == false && tmp[j] == '*') {
                heartColumn = i + 1;
                heartRow = j;
                heartFlag = true;
            }
        }
    }

    for (int i = heartRow - 1; i >= 0; i--) {
        if (cookie[heartColumn][i] == '*') {
            leftArm++;
        }
    }
    for (int i = heartRow + 1; i < N; i++) {
        if (cookie[heartColumn][i] == '*') {
            rightArm++;
        }
    }
    for (int i = heartColumn + 1; i < N; i++) {
        if (cookie[i][heartRow] == '*') {
            waist++;
        }
        if (cookie[i][heartRow] == '_') {
            for (int j = i; j < N; j++) {
                if (cookie[j][heartRow - 1] == '*') {
                    leftLeg++;
                }
                if (cookie[j][heartRow + 1] == '*') {
                    rightLeg++;
                }
            }
            break;
        }
    }

    cout << heartColumn + 1 << " " << heartRow + 1 << "\n";
    cout << leftArm << " " << rightArm << " " << waist << " " << leftLeg << " " << rightLeg << "\n"; 
}