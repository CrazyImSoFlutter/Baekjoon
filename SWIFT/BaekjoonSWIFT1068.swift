let N = Int(readLine()!)!
var node = readLine()!.split(separator: " ").map { Int(String($0))! }
let delete = Int(readLine()!)!
var visit = Array(repeating: false, count: N)
var childTree = Array(repeating: [Int](), count: N)
var answer = 0
for i in 0..<N {
    if node[i] == -1 {
        continue
    }
    childTree[node[i]].append(i)
}


func delete(_ del: Int) {
    visit[del] = true
    for i in childTree[del] {
        if visit[i] == false {
            delete(i)
        }
    }
}

func dfs(_ num: Int) {
    if visit[num] == true {
        return
    }
    var tmp = childTree[num].count
    visit[num] = true
    if childTree[num].contains(delete) {
        tmp -= 1
    }
    if tmp == 0 {
        answer += 1
    }
    for i in childTree[num] {
        if visit[i] == false {
            dfs(i)
        }
    }
}

delete(delete)
for i in 0..<N {
    dfs(i)
}
print(answer)
