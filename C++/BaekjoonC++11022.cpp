#include<iostream>
using namespace std;

int main ()
{
    int A, B, C;
    
    cin >> C;
    
    for(int i = 1; i <= C; i++)
    {
        cin >> A;
        cin >> B;
        cout <<"Case #"<< i << ": " << A << " + " << B << " = " << A+B << endl;
    }
    
}
