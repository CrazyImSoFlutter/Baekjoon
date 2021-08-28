let N = Int(readLine()!)!
var tree = Array(repeating: [Int](), count: 100001)
var visit = Array(repeating: false, count: 100001)
var parent = Array(repeating: 0, count: 100001)

func findParent(_ node: Int) {
    visit[node] = true
    for i in 0..<tree[node].count {
        let next = tree[node][i]
        if visit[next] == false {
            parent[next] = node
            findParent(next)
        }
    }
}

for i in 0..<N - 1 {
    let node = readLine()!.split(separator: " ").map { Int(String($0))! }

    tree[node[0]].append(node[1])
    tree[node[1]].append(node[0])
}

findParent(1)

print(parent[2...N].map { String($0) }.joined(separator: "\n"))

