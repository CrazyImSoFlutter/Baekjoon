let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = NM[0]; let M = NM[1]
var arr = Array(repeating: 0, count: M)
var visit = Array(repeating: false, count: N)

func dfs(_ n: Int, _ m: Int, _ depth: Int) {
    if depth == m {
        print(arr.map { String($0) }.joined(separator: " "))
        return
    }
    
    for i in 0..<N {
        if visit[i] == false {
            visit[i] = true
            if depth != 0 {
                if arr[depth - 1] < i + 1 {
                    arr[depth] = i + 1
                    dfs(N, M, depth + 1)
                }
            } else {
                arr[depth] = i + 1
                dfs(N, M, depth + 1)
            }
            visit[i] = false
        }
    }
    return
}

dfs(N, M, 0)

