#include<iostream>
using namespace std;

int main ()
{
    int A = 0;
    int B = 0;
    int C = 0;
    
    cin >> C;
    
    for (int i = 0; i < C; i++)
    {
        cin >> A;
        cin >> B;
        cout << A + B << endl;
    }
}
