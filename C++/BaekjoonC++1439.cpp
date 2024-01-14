#include<iostream>
#include<algorithm>
using namespace std;

string S;
char lastRead = 'a';
int zeroArea;
int oneArea;

int main() {
    cin >> S;

    for (int i = 0; i < S.length(); i++) {
        if (lastRead != S[i] && S[i] == '0') zeroArea++;
        if (lastRead != S[i] && S[i] == '1') oneArea++;
        lastRead = S[i];
    }
    cout << min(zeroArea, oneArea) << '\n';
}
