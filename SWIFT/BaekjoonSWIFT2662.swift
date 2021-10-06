let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = NM[0], M = NM[1]
var C = Array(repeating: Array(repeating: 0, count: M + 1), count: N + 1)
var D = Array(repeating: Array(repeating: -1, count: M + 1), count: N + 1)
var A = Array(repeating: Array(repeating: 0, count: M + 1), count: N + 1)

for _ in 0..<N {
    let tmp = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    for i in 1...M {
        C[tmp[0]][i] = tmp[i]
    }
}

func output(_ invest: Int, _ company: Int) -> Int {
    if company > M {
        return 0
    }
    if D[invest][company] != -1 {
        return D[invest][company]
    }
    for i in 0...invest {
        let tmp = C[i][company] + output(invest - i, company + 1)
        if D[invest][company] < tmp {
            D[invest][company] = tmp
            A[invest][company] = i
        }
    }
    return D[invest][company]
}

print(output(N, 1))
var total = N

for i in 1...M {
    print(A[total][i], terminator: " ")
    total -= A[total][i]
}
