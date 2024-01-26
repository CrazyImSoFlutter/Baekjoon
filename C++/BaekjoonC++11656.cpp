#include <iostream>
#include <algorithm>
using namespace std;

string str, arr[1001];
int length;

int main() {
    cin >> str;
    length = str.length();
    
    
    for (int i = 0; i < length; i++) {
        arr[i] = str.substr(i, length);
    }
    
    sort(arr, arr + length);
    
    for (int i = 0; i < length; i++) {
        cout << arr[i] << '\n';
    }
}