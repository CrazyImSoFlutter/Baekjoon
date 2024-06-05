#include <iostream>
#include <string>

using namespace std;

bool isVowel(char c) {
    if (c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u')
        return true;
    return false;
}

int main() {

    while(1) {
        string S = "";

        cin >> S;
        char prev = ' ';
        int vowelCount = 0;
        int consonantCount = 0;
        bool vowelFlag = false;
        bool flag = true;

        if (S == "end") {
            break;
        }

        for (int i = 0; i < S.length(); i++) {
            if (isVowel(S[i])) {
                vowelFlag = true;
                if (i == 0) {
                    vowelCount = 1;
                } else {
                    if (isVowel(prev)) {
                        vowelCount += 1;
                    } else {
                        vowelCount = 1;
                        consonantCount = 0;
                    }
                }
            } else {
                if (i == 0) {
                    consonantCount = 1;
                } else {
                    if (!isVowel(prev)) {
                        consonantCount += 1;
                    } else {
                        consonantCount = 1;
                        vowelCount = 0;
                    }
                }

            }

            if (prev == S[i]) {
                if (!(S[i] == 'e' || S[i] == 'o')) {
                    flag = false;
                    break;
                }
            }

            if (vowelCount == 3 || consonantCount == 3) {
                flag = false;
                break;
            }
            prev = S[i];
        }

        if (!vowelFlag) {
            flag = false;
        }

        if (flag) {
            cout << "<" << S << ">" << " is acceptable.\n";
        } else {
            cout << "<" << S << ">" << " is not acceptable.\n";
        }
        
    }

}