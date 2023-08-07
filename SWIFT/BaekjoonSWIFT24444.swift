let NMR = readLine()!.split(separator: " ").map { Int(String($0))!}
let N = NMR[0], M = NMR[1], R = NMR[2]
var graph = Array(repeating: [Int](), count: 100001)
var visit = Array(repeating: false, count: 100001)
var count = 0
var answer = ""
var result = Array(repeating: 0, count: 100001)

for _ in 0..<M {
    let uv = readLine()!.split(separator: " ").map { Int(String($0))!}
    let u = uv[0], v = uv[1]
    
    graph[u].append(v)
    graph[v].append(u)
}

for i in 0..<100001 {
    if graph[i].count > 1 {
        graph[i] = graph[i].sorted(by: <)
    }
}

func bfs(node: Int) {
    var queue = [Int]()
    var index = 0
    
    queue.append(node)
    count += 1
    visit[node] = true
    result[node] = count
    while index != queue.count {
        let curElement = queue[index]
        index += 1
        
        for i in 0..<graph[curElement].count {
            if !visit[graph[curElement][i]] {
                count += 1
                queue.append(graph[curElement][i])
                result[graph[curElement][i]] = count
                visit[graph[curElement][i]] = true
            }
        }
    }
}

bfs(node: R)
for i in 1...N {
    print(result[i])
}
