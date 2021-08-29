var nm = [Int]()
var caseCnt = 0

func dfs(_ tree: [[Int]], _ visit: inout [Bool], _ node: Int, _ cnt: inout Int, _ vtx: inout Int) {
    var flag = false
    visit[node] = true
    vtx += 1
    if tree[node].count == 0 {
        return
    }
    for i in 0..<tree[node].count {
        if tree[node].count > 1 {
            for j in tree[node] {
                if visit[j] == false {
                    flag = true
                    break
                }
            }
            if flag == false {
                cnt += 1
            }
        }
        if visit[tree[node][i]] == false {
            cnt += 1
            dfs(tree, &visit, tree[node][i], &cnt, &vtx)
        }
    }
}

while true {
    nm = readLine()!.split(separator: " ").map { Int(String($0))! }
    let n = nm[0]
    let m = nm[1]
    var tree = Array(repeating: [Int](), count: n + 1)
    var visit = Array(repeating: false, count: n + 1)
    var count = 0
    var vertex = 0
    var treeCount = 0
    caseCnt += 1
    if nm[0] == 0 && nm[1] == 0 {
        break
    }
    for i in 0..<m {
        let tmp = readLine()!.split(separator: " ").map { Int(String($0))! }
        tree[tmp[0]].append(tmp[1])
        tree[tmp[1]].append(tmp[0])
    }
    for i in 1...n {
        if visit[i] == true {
            continue
        }
        count = 0
        vertex = 0
        dfs(tree, &visit, i, &count, &vertex)
        if count == vertex - 1 {
            treeCount += 1
        }
    }
    if treeCount == 0 {
        print("Case \(caseCnt): No trees.")
    } else if treeCount == 1 {
        print("Case \(caseCnt): There is one tree.")
    } else {
        print("Case \(caseCnt): A forest of \(treeCount) trees.")
    }
}
