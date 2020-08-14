#include<iostream>
using namespace std;

int main()
{
    int H = 0;
    int M = 0;
    cin >> H;
    cin >> M;
    
    if(M>=0 && M<45 && H > 0)
    {
        cout << (H-1) << " ";
        cout << (60 - 45 + M);
    }
    else if (M >= 45 && H >= 0)
    {
        cout << H << " ";
        cout << (M-45) ;
    }
    else if(M>=0 && M<45 && H == 0)
    {
        cout << "23 ";
        cout << (60 - 45 + M);
    }
}
