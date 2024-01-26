#include <iostream>
#include <vector>

using namespace std;

int N, maxLength;
vector <int> nums;

int main(){
    cin >> N;
    for(int i = 1; i <= N; i++){
        int secondNum = i;
        int nextNum = N - secondNum;
        int length = 3;

        vector<int> v;
        v.push_back(N);
        v.push_back(secondNum);
        v.push_back(nextNum);

        while(true){
            int tmp = nextNum;
            nextNum = secondNum - nextNum;
            if(nextNum < 0) break;
            secondNum = tmp;
            length++;
            v.push_back(nextNum);
        }

        if(maxLength < length) nums = v, maxLength = length;
    }
    cout << maxLength << '\n';
    for (int i = 0; i < maxLength; i++) {
        cout << nums[i] << ' ';
    }
}