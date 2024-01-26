#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

void solve(void);


int N;
int main(void)
{
	ios::sync_with_stdio(false);
	cin.tie(NULL);
	
	cin >> N;

	vector<pair<int, int> > v;
    vector<int> p(N);

	for (int i = 0; i < N; i++) {
		int a;
		
        cin >> a;
		v.push_back(std::make_pair(a, i));
	}

	sort(v.begin(), v.end());

	for (int i = 0; i < N; i++)
		p[v[i].second] = i;

	for (auto a : p)
		cout << a << ' ';
}