import Foundation

let AB = readLine()!.split(separator: " ").map { UInt64(String($0))! }
let A = AB[0], B = AB[1]
var dp : [UInt64] = Array(repeating: 0, count: 56)
dp[0] = 1
for i in 1...55 {
    dp[i] = dp[i - 1] * 2 + 1 << i
}

func getOne(_ n: UInt64) -> UInt64 {
    var binary = [UInt64]()
    var tmp : UInt64 = n
    var num : UInt64 = n

    if n == 0 {
        return 0
    }
    while tmp != 0 {
        binary.append(tmp % 2)
        tmp /= 2
    }
    var answer : UInt64 = 0
    for i in stride(from: binary.count - 1, through: 0, by: -1) {
        if binary[i] == 1 {
            if i == 0 {
                answer += 1
                continue
            }
            answer += dp[i - 1] + num - (1 << i) + 1
            num -= 1 << i
        }
    }
    return answer
}

print(getOne(B) - getOne(A - 1))
