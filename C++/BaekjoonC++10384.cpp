#include <iostream>
#include <algorithm>

using namespace std;

int N;

int main() {
    cin >> N;
    cin.ignore();

    for (int i = 0; i < N; i++) {
        string str;
        getline(cin, str);

        transform(str.begin(), str.end(), str.begin(), :: tolower);
 
        int arr[26]={0};
        int cnt=0;
        int len = str.length();
 
        for(int i = 0; i<len; i++){
            cnt= str[i] - 97;
            arr[cnt]++;
        }

        int cnt1 = 0;
        int cnt2 = 0;
        int cnt3 = 0;

        for (int i = 0; i< 26; i++) {
            if (arr[i] != 0)
                cnt1++;

            if (arr[i] == 2)
                cnt2++;

            if (arr[i] >= 3)
                cnt3++;
        }
        if (cnt3 == 26) {
            cout<<"Case "<< i + 1 <<": "<<"Triple pangram!!!\n";
        } else if (cnt2 == 26 || cnt2 + cnt3 == 26) {
            cout<<"Case " << i + 1 << ": " << "Double pangram!!\n";
        } else if (cnt1 == 26) {
            cout<<"Case " << i + 1 << ": "<<"Pangram!\n";
        } else {
            cout<<"Case " << i + 1 << ": "<<"Not a pangram\n";
        }
    }
}