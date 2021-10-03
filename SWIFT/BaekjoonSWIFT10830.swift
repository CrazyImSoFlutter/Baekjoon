let NB = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = NB[0], B = NB[1]
var M = Array(repeating: [Int](), count: N)
let MOD = 1000
for i in 0..<N {
    M[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
}
for i in 0..<N {
    for j in 0..<N {
        M[i][j] %= MOD
    }
}


func pow(_ m: [[Int]], _ b: Int) -> [[Int]] {
    if b == 1 {
        return m
    }
    var ret = pow(m, b / 2)

    ret = multiple(ret, ret)
    if b % 2 == 1 {
        ret = multiple(ret, M)
    }
    return ret
}

func multiple(_ m: [[Int]], _ n: [[Int]]) -> [[Int]] {
    var ret = Array(repeating: Array(repeating: 0, count: N), count: N)

    for i in 0..<N {
        for j in 0..<N {
            for k in 0..<N {
                ret[i][j] += m[i][k] * n[k][j]
                ret[i][j] %= MOD
            }
        }
    }
    return ret
}

func printM(_ b: Int) {
    let m = pow(M, B)

    if b == 1 {
        for i in 0..<N {
            print(M[i].map { String($0) }.joined(separator: " "))
        }
    } else {
        for i in 0..<N {
            print(m[i].map { String($0) }.joined(separator: " "))
        }
    }
}


printM(B)
