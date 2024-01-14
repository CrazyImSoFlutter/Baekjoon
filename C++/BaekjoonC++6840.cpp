#include <iostream>
#include <algorithm>
using namespace std;

int arr[3];

bool compare (int a, int b) {
    return a > b;
}

int main() {
    cin >> arr[0];
    cin >> arr[1];
    cin >> arr[2];

    sort(arr, arr + 3, compare);

    cout << arr[1];
}