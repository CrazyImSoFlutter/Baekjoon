#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

bool compare(vector<int> a, vector<int> b) {
    if (a[1] != b[1]) {
        return a[1] < b[1];
    } else {
        return a[2] < b[2];
    }
}

int T;

int main() {
    cin >> T;

    while (T--) {
        int N;
        int teamCount[201] = {0, };
        vector<int> team;
        vector<int> teamScore[201];
        vector<vector<int> > finalScore;

        cin >> N;
        for (int i = 0; i < N; i++) {
            int t;

            cin >> t;
            team.push_back(t);
            teamCount[t]++;
        }
        for (int i = 0; i < 201; i++) {
            if (teamCount[i] < 6) {
                team.erase(std::remove(team.begin(), team.end(), i), team.end());
            }
        }

        for (int i = 0; i < team.size(); i++) {
            teamScore[team[i]].push_back(i + 1);
        }
        for (int i = 1; i <= 200; i++) {
            if (teamScore[i].size() < 6) {
                continue;
            }

            int sum = 0;
            vector<int> tmp;

            for (int j = 0; j < 4; j++) {
                sum += teamScore[i][j];
            }

            tmp.push_back(i);
            tmp.push_back(sum);
            tmp.push_back(teamScore[i][4]);

            finalScore.push_back(tmp);
        }

        sort(finalScore.begin(), finalScore.end(), compare);

        cout << finalScore[0][0] << "\n";
    }
}

