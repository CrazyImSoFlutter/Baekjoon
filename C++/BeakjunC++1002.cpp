#include <iostream>
#include <algorithm>
#include <cmath>
using namespace std;

int main(void){
    int T;

    cin>>T;

    for(int i=0; i<T; ++i)
    {
        int x1, x2, y1, y2, r1, r2, ret;
        cin>>x1>>y1>>r1;
        cin>>x2>>y2>>r2;

        double d = sqrt(pow(x2- x1, 2) + pow(y2 - y1, 2));
        int big = max(r1, r2);
        int small = min(r1, r2);

        if(d == 0.0){
            if(big == small)
                ret = -1;
            else
                ret = 0;
        }else{
            if(big-small < d && big+small > d)
                ret = 2;
            else if(big+small == d || big-small == d)
                ret = 1;
            else
                ret = 0;
        }
        cout<<ret<<endl;
    }
    return 0;
}
