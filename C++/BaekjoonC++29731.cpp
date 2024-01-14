#include <iostream>
using namespace std;

int N;
string str;
string answer = "No";

string a[] = {  "Never gonna give you up",
                "Never gonna let you down",
                "Never gonna run around and desert you",
                "Never gonna make you cry",
                "Never gonna say goodbye",
                "Never gonna tell a lie and hurt you",
                "Never gonna stop" };


int main() {
    bool check = false;
    cin >> N;

    for (int i = 0; i < N; i++) {
        getline(cin, str);
        cin.ignore(1024,'\n');
        for (int j = 0; j < 7; j++) {
            if (str == a[j]) check = true;
            
        }
    }
    if (check)
        cout << 'No' << "\n";
    else
        cout << 'Yes' << "\n";
}