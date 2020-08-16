#include<iostream>
#include<ios>
using namespace std;

int main ()
{
    cin.tie(NULL);
    ios::sync_with_stdio(false);
    int A = 0 ;
    int B = 0 ;
    int T = 0 ; 
    
    cin >> T ;
    
    for(int i = 0; i < T ; i++)
    {
        cin >> A;
        cin >> B;
        cout << (A + B) << "\n";
    }
    
}
