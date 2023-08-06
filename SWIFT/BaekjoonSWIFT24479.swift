let NMR = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = NMR[0], M = NMR[1], R = NMR[2]
var graph = Array(repeating: [Int](), count: 100001)
var visit = Array(repeating: 0, count: 100001)
var cnt = 0
var answer = ""

for _ in 0..<M {
    let uv = readLine()!.split(separator: " ").map { Int(String($0))! }
    let u = uv[0], v = uv[1]
    
    graph[u].append(v)
    graph[v].append(u)
}

for i in 0..<100001 {
    if graph[i].count > 1 {
        graph[i] = graph[i].sorted(by: <)
    }
}

func dfs(_ node: Int) {
    if visit[node] != 0 {
        return
    }
    cnt += 1
    visit[node] = cnt
    
    for i in 0..<graph[node].count {
        dfs(graph[node][i])
    }
}

dfs(R)

for i in 1...N {
    answer += "\(visit[i])\n"
}
print(answer)
