#include <iostream>
#include <string>
#include <algorithm>

int main() {
	std::ios_base::sync_with_stdio(false);
	std::cin.tie(0), std::cout.tie(0);

	std::string str;
	std::cin >> str;

	std::string s = str.substr(0, 1);
	for (int i = 1; i < str.size(); i++) {
		if (s[i - 1] < str[i])
			s = str[i] + s;
		else
			s = s + str[i];
	}
	reverse(s.begin(), s.end());
	std::cout << s;
}
