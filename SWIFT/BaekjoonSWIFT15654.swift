let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = NM[0], M = NM[1]
var num = readLine()!.split(separator: " ").map { Int(String($0))! }
var visit = Array(repeating: false, count: N)
var arr = Array(repeating: 0, count: M)
var answer = ""
num.sort()

func dfs(_ n: Int, _ m: Int, _ depth: Int) {
    if depth == m {
        answer += "\(arr.map { String($0) }.joined(separator: " "))\n"
        return
    }
    
    for i in 0..<n {
        if visit[i] == false {
            visit[i] = true
            arr[depth] = num[i]
            dfs(n, m, depth + 1)
            visit[i] = false
        }
    }
}

dfs(N, M, 0)
print(answer)
