let NMV = readLine()!.split(separator: " ").map{ Int(String($0))! }
let N = NMV[0], M = NMV[1], V = NMV[2]
var graph = Array(repeating: Array(repeating: 0, count: 10001), count: 10001)
var DFSvisit = Array(repeating: 0, count: 10001)
var BFSvisit = Array(repeating: 0, count: 10001)
var DFSq = [Int]()
var BFSq = [Int]()
for _ in 0..<M {
    let tmp = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph[tmp[0]][tmp[1]] = 1
    graph[tmp[1]][tmp[0]] = 1
}

func DFS(_ V: Int, _ N: Int) {
    DFSvisit[V] = 1
    print("\(V) ", terminator: "")
    for i in 1...N {
        if graph[V][i] == 1 && DFSvisit[i] == 0 {
            DFS(i, N)
        }
    }
}

func BFS(_ V: Int, _ N: Int) {
    print("\(V) ", terminator: "")
    BFSvisit[V] = 1
    BFSq.append(V)
    var index = 0
    while index < BFSq.count {
        let cur = BFSq[index]
        index += 1
        for i in 1...N {
            if graph[cur][i] == 1 && BFSvisit[i] == 0 {
                print("\(i) ", terminator: "")
                BFSq.append(i)
                BFSvisit[i] = 1
            }
        }
    }
}
DFS(V, N)
print("")
BFS(V, N)
