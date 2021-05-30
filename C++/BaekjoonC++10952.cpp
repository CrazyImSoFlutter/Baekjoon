#include<iostream>
using namespace std;

int main ()
{
    int A = 0; 
    int B = 0;
    while(1)
    {
        cin >> A >> B;
        if(A == 0 && B == 0)
        {
            break;
        }
        else 
            cout << A+B <<endl;
        
    }
}
