#include<iostream>
#include<string>
using namespace std; 

int main() 
{ 
    string input;

    cin >> input;
    for (int i = 0; i < input.length(); i++) {
        if (input[i] <= 90) input[i] += 32;
        else input[i] -= 32;
    }
    cout << input;
}
