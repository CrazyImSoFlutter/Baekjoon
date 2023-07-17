let N = Int(readLine()!)!
var memo = Array(repeating: 0, count: 41)

memo[5] = 5
memo[6] = 8

func code1(num: Int) -> Int {
    if memo[num] == 0 {
        let p1 = code1(num: num - 1)
        let p2 = code1(num: num - 2)
        memo[num] = p1 + p2
        return memo[num]
    } else {
        return memo[num]
    }
}

func code2 (num: Int) {
    
    
}

print(code1(num: 30))
