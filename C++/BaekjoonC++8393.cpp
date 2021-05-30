#include<iostream>
using namespace std;

int main ()
{
    int N = 0;
    int Sum = 0;
    cin >> N;
    
    for (int i = 1; i <= N; i++)
    {
        Sum = Sum + i;
    }
    cout << Sum;
}
