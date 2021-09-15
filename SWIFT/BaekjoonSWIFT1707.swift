let K = Int(readLine()!)!

func dfs(_ from: Int, _ visit: inout [Bool],  _ color: inout [Bool], _ graph: inout [[Int]], _ isBi: inout Bool) {
    visit[from] = true

    let len = graph[from].count
    for i in 0..<len {
        let node = graph[from][i]
        if visit[node] == false {
            color[node] = !color[from]
            dfs(node, &visit, &color, &graph, &isBi)
        } else if color[node] == color[from] {
            isBi = true
            return
        }
    }
}

for _ in 0..<K {
    let VE = readLine()!.split(separator: " ").map { Int(String($0))! }
    let V = VE[0], E = VE[1]
    var graph = Array(repeating: [Int](), count: 200001)
    var visit = Array(repeating: false, count: 200001)
    var color = Array(repeating: false, count: 200001)
    var isBi = false
    for i in 1...E {
        let tmp = readLine()!.split(separator: " ").map { Int(String($0))! }
        graph[tmp[0]].append(tmp[1])
        graph[tmp[1]].append(tmp[0])
    }
   
    for i in 1...V {
        if visit[i] == false {
            dfs(i, &visit, &color, &graph, &isBi)
        }
    }
    print(isBi ? "NO" : "YES")
}

