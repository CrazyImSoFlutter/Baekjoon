import Foundation

let N = readLine()!
var NArr = [Int]()
var dp = Array(repeating: Array(repeating: 0, count: 10), count: N.count + 1)
var dp2 = Array(repeating: Array(repeating: 0, count: 10), count: N.count + 1)

for i in N {
    NArr.append(Int(String(i))!)
}
NArr.reverse()
dp[1] = [0, 1, 1, 1, 1, 1, 1, 1, 1, 1]
if N.count != 1 {
    for i in 2...N.count {
        var tmp = Array(repeating: 0, count: 10)
        for k in 1..<i {
            for l in 0..<10 {
                tmp[l] += dp[k][l]
            }
        }
        for j in 0..<10 {
            if j == 0 {
                for l in 0..<i {
                    if l == 0 {
                        dp[i][0] += i - 1
                    } else {
                        dp[i][0] += (i - l - 1) * 9 * Int(pow(Double(10), Double(l - 1))) + dp[l][0]
                    }
                }
                dp[i][0] *= 9
            } else {
                dp[i][j] = Int(pow(Double(10), Double(i - 1))) + tmp[j] * 9
            }
        }
    }
}

var answer = Array(repeating: 0, count: 10)

for i in 1...N.count {
    for j in 1...i {
        for k in 0..<10 {
            dp2[i][k] += dp[j][k]
        }
    } 
}
for i in stride(from: NArr.count, to: 0, by: -1) {
    if i == 1 {
        for j in 0...NArr[0] {
            answer[j] += 1
        }
        break
    }
    answer[NArr[i - 1]] += (Int(N)! % Int(pow(Double(10), Double(i - 1))) + 1)
    for j in 0..<NArr[i - 1] {
        if j == 0 {
            for k in 0..<10 {
                if i != NArr.count && k == 0 {
                    continue
                }
                answer[k] += dp2[i - 1][k]
            }
            if i != NArr.count {
                answer[0] += Int(pow(Double(10), Double(i - 1)))
                for k in 0..<i {
                    if k == 0 {
                        answer[0] += i - 1
                    } else {
                        answer[0] += (i - k - 1) * 9 * Int(pow(Double(10), Double(k - 1))) + dp[k][0]
                    }
                }
            }
        } else {
            answer[j] += Int(pow(Double(10), Double(i - 1)))
            for k in 0..<i {
                if k == 0 {
                    answer[0] += i - 1
                } else {
                    answer[0] += (i - k - 1) * 9 * Int(pow(Double(10), Double(k - 1))) + dp[k][0]
                }
            }
            for k in 1..<10 {
                answer[k] += dp2[i - 1][k]
            }
        }
    }
}

if N.count == 1 {
    answer[0] -= 1
}
print(answer.map { String($0) }.joined(separator: " "))
