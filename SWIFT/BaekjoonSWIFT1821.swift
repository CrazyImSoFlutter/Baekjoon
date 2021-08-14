let NF = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = NF[0]
let F = NF[1]
var pascal = Array(repeating: [Int](), count: 10)
var visit = Array(repeating: false, count: N)
var arr = Array(repeating: 0, count: N)
var flag = false

pascal[0].append(1)
for i in 1..<10 {
    for j in 0...i {
        if j == 0 { pascal[i].append(pascal[i - 1][0]) }
        else if j == i { pascal[i].append(pascal[i - 1][j - 1])}
        else { pascal[i].append(pascal[i - 1][j - 1] + pascal[i - 1][j]) } 
    }
}

func dfs(_ n: Int, _ depth: Int) {
    if depth == n {
        var sum = 0
        for i in 0..<n {
            sum += pascal[n - 1][i] * arr[i]
        }
        if sum == F {
            print(arr.map { String($0) }.joined(separator: " "))
            flag = true
            return
        }
    }
    if flag == true { return }
    for i in 0..<n {
        if !visit[i] {
            visit[i] = true
            arr[depth] = i + 1
            dfs(n, depth + 1)
            visit[i] = false
        }
    }
}

dfs(N, 0)
