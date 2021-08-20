let NMK = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = NMK[0]
let M = NMK[1]
let K = NMK[2]
var A = Array(repeating: [Int](), count: N)
var answer = 50000
for i in 0..<N {
    A[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
}
var rcs = Array(repeating: [Int](), count : K)
for i in 0..<K {
    rcs[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
}
var arr = Array(repeating: 0, count: K)
var visit = Array(repeating: false, count: K)

func rotate(_ tmpA: inout [[Int]],_ r: Int, _ c: Int, _ s: Int) {
    for i in 1...s {
        var pos = (r - i - 1, c - i - 1)
        let tmp = tmpA[pos.0][pos.1]
        for _ in 1..<(i * 2 + 1) {
            tmpA[pos.0][pos.1] = tmpA[pos.0 + 1][pos.1]
            pos.0 += 1
        }
        for _ in 1..<(i * 2 + 1) {
            tmpA[pos.0][pos.1] = tmpA[pos.0][pos.1 + 1]
            pos.1 += 1
        }
        for _ in 1..<(i * 2 + 1) {
            tmpA[pos.0][pos.1] = tmpA[pos.0 - 1][pos.1]
            pos.0 -= 1
        }
        for j in 1..<(i * 2 + 1) {
            if j == i * 2 {
                tmpA[pos.0][pos.1] = tmp
            } else {
                tmpA[pos.0][pos.1] = tmpA[pos.0][pos.1 - 1]
                pos.1 -= 1
            }
        }
    }
}

func dfs(_ k: Int, _ depth: Int) {
    if depth == k {
        var tmpA = A
        for i in arr {
            rotate(&tmpA, rcs[i][0], rcs[i][1], rcs[i][2])
        }
        for i in 0..<N {
            answer = min(answer, tmpA[i].reduce(0, +))
        }
    }
    for i in 0..<k {
        if visit[i] == false {
            visit[i] = true
            arr[depth] = i
            dfs(k, depth + 1)
            visit[i] = false
        }
    }
}

dfs(K, 0)
print(answer)
