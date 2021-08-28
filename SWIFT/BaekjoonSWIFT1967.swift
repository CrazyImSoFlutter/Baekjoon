let N = Int(readLine()!)!
var tree = Array(repeating: [(Int, Int)](), count: N + 1)
var visit = Array(repeating: false, count: N + 1)
var answer = 0
var endNode = 0

for _ in 0..<N - 1 {
    let tmp = readLine()!.split(separator: " ").map { Int(String($0))! }
    tree[tmp[0]].append((tmp[1], tmp[2]))
    tree[tmp[1]].append((tmp[0], tmp[2]))
}

func getDistance(_ node: Int, _ length: Int) {
    if visit[node] {
        return
    }
    visit[node] = true
    if answer < length {
        answer = length
        endNode = node
    }
    for i in 0..<tree[node].count {
        getDistance(tree[node][i].0, length + tree[node][i].1)
    }
}

getDistance(1, 0)

answer = 0
visit = Array(repeating: false, count: N + 1)
getDistance(endNode, 0)

print(answer)
