import Foundation

let N = Int(readLine()!)!
var tree = [(Int, Int, Int)]()
var arr = [Int]()
var visit = Array(repeating: false, count: N)

for _ in 0..<N {
    let info = readLine()!.split(separator: " ").map { Int(String($0))! }
    tree.append((info[0], info[1], info[2]))
}

func check(_ fence: Int, _ tmp: [(Int, Int, Int)]) -> Bool {
    let maxX = (tmp.max(by: { $0.0 < $1.0 }) ?? (0, 0, 0)).0
    let maxY = (tmp.max(by: { $0.1 < $1.1 }) ?? (0, 0, 0)).1
    let minX = (tmp.min(by: { $0.0 < $1.0 }) ?? (0, 0, 0)).0
    let minY = (tmp.min(by: { $0.1 < $1.1 }) ?? (0, 0, 0)).1
    if fence >= (maxX - minX) * 2 + (maxY - minY) * 2 {
        return true
    }
    return false
}

func dfs(_ m: Int, _ depth: Int) {
    if depth == m {
        var sum = 0
        var tmp = tree
        for i in stride(from: m - 1, through: 0, by: -1) {
            sum += tmp[arr[i]].2
            tmp.remove(at: arr[i])
        }
        if check(sum, tmp) {
            print(m)
            exit(0)
        }
        return
    }
    
    for i in 0..<N {
        if visit[i] == false {
            visit[i] = true
            if depth != 0 {
                if arr[depth - 1] < i {
                    arr[depth] = i
                    dfs(m, depth + 1)
                }
            } else {
                arr[depth] = i
                dfs(m, depth + 1)
            }
            visit[i] = false
        }
    }
}

for i in 1...N {
    arr = Array(repeating: 0, count: i)
    dfs(i, 0)
}
