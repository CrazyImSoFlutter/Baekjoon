#include<iostream>

using namespace std;

int N, K, answer = 0;

int arr[31][31];

void paskal(int idx) {

	if(idx) {
	    for (int i = 0; i < idx; i++) {
		    if (i == 0)
			    arr[idx][i] = 1;
		    else if (i == idx - 1)
			    arr[idx][i] = 1;
		    else
			    arr[idx][i] = arr[idx - 1][i - 1] + arr[idx - 1][i];

		    if (idx == N && i == K - 1) {
			    answer = arr[idx][i];
			    return ;
		    }
	    }
    }
	paskal(idx + 1);
}

int main() {
	cin >> N >> K;

	arr[0][0] = 1;
	arr[1][0] = arr[1][1] = 1;

	if (N == 1) {
		cout << 1 << '\n';
		return 0;
	}

	paskal(2);
	cout << answer << '\n';

}