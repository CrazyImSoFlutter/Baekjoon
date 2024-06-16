#include <iostream>
#include <cmath>
#include <string.h>
#include <vector>

using namespace std;

int N, answer;
int alphabet[26] = {0, };
string word, tmp;

int main() {
    cin >> N;

    cin >> word;
    for (int i = 0; i < word.length(); i++) {
        alphabet[word[i] - 65]++;
    }

    for (int i = 1; i < N; i++) {
        int tmp_alphabet[26] = {0, };
        vector<int> diff;

        cin >> tmp;
        for (int j = 0; j < tmp.length(); j++)
            tmp_alphabet[tmp[j] - 65]++;

        for (int j = 0; j < 26; j++) {
            if (alphabet[j] != tmp_alphabet[j])
                diff.push_back(alphabet[j] - tmp_alphabet[j]);
        }

        if (diff.empty()) {
            answer++;
        } else if (diff.size() == 1 && abs(diff[0]) == 1) {
            answer++;
        } else if (diff.size() == 2 && abs(diff[0]) == 1 && diff[0] + diff[1] == 0) {
            answer++;
        }
    }
    cout << answer;
}