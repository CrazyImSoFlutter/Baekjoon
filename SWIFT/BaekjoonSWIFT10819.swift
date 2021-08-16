let N = Int(readLine()!)!
var A = readLine()!.split(separator: " ").map { Int(String($0))! }
var visit = Array(repeating: false, count: N)
var arr = Array(repeating: 0, count: N)
var answer = 0

func arrayAbs() -> Int {
    var sum = 0
    for i in 0..<N - 1 {
        sum += abs(A[arr[i]] - A[arr[i + 1]])
    }
    return sum
}

func dfs(_ n: Int, _ depth: Int) {
    if depth == n {
        answer = max(answer, arrayAbs())
        return
    }
    for i in 0..<n {
        if visit[i] == false {
            visit[i] = true
            arr[depth] = i
            dfs(n, depth + 1)
            visit[i] = false
        }
    }
}

dfs(N, 0)
print(answer)
