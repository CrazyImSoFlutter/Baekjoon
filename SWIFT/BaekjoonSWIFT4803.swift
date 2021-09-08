var nm = [Int]()
var caseCount = 0

while true {
    nm = readLine()!.split(separator: " ").map { Int(String($0))! }
   
    let n = nm[0]
    let m = nm[1]
    if n == 0, m == 0 {
        break
    }
    var tree = Array(repeating: [Int](), count: n + 1)
    var visit = Array(repeating: false, count: n + 1)
    var treeCount = 0
    caseCount += 1

    for i in 0..<m {
        let tmp = readLine()!.split(separator: " ").map { Int(String($0))! }
        tree[tmp[0]].append(tmp[1])
        tree[tmp[1]].append(tmp[0])
    }

    for i in 1...n {
        if !visit[i] {
            if dfs(tree, &visit, i, 0) {
                treeCount += 1
            }
        }
    }

    if treeCount > 1 {
        print("Case \(caseCount): A forest of \(treeCount) trees.")
    } else if treeCount == 1 {
        print("Case \(caseCount): There is one tree.")
    } else if treeCount == 0 {
        print("Case \(caseCount): No trees.")
    }
}

func dfs(_ tree: [[Int]], _ visit: inout [Bool], _ node: Int, _ postNode: Int) -> Bool {
    visit[node] = true
    
    for i in 0..<tree[node].count {
        if tree[node][i] == postNode {
            continue
        }
        if visit[tree[node][i]] {
            return false
        }
        if dfs(tree, &visit, tree[node][i], node) == false {
            return false
        }
    }
    return true
}
