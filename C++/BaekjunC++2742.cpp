#include<iostream>
#include<ios>
using namespace std;

int main ()
{
    cin.tie(NULL);
    ios::sync_with_stdio(false);
    
    int C = 0;
    cin >> C;
    for (int i = 0; i < C; i ++)
    {
        cout << C-i << "\n";
    }
}
