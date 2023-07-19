import Foundation

let N = Int(readLine()!)!
var memo = Array(repeating: 0, count: 16)

memo[1] = 3

func getPointNum(num: Int) -> Int {
    if memo[num] != 0 {
        return memo[num]
    } else {
        memo[num] = getPointNum(num: num - 1) * 2 - 1
        return memo[num]
    }
}

print(Int(pow(Double(getPointNum(num: N)), 2.0)))
