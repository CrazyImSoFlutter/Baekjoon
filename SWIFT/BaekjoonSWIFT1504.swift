import Foundation

// 라이노님의 FileIO
final class FileIO {
    private var buffer:[UInt8]
    private var index: Int
    
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)]
        index = 0
    }
    
    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        
        return buffer.withUnsafeBufferPointer { $0[index] }
    }
    
    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true
        
        while now == 10
                || now == 32 { now = read() }
        if now == 45{ isPositive.toggle(); now = read() }
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }
        
        return sum * (isPositive ? 1:-1)
    }
    
    @inline(__always) func readString() -> String {
        var str = ""
        var now = read()
        
        while now == 10
                || now == 32 { now = read() }
        
        while now != 10
                && now != 32 && now != 0 {
            str += String(bytes: [now], encoding: .ascii)!
            now = read()
        }
        
        return str
    }
}

public struct Heap<T> {
    var nodes: [T] = []
    let comparer: (T,T) -> Bool
    var isEmpty: Bool {
        return nodes.isEmpty
    }

    init(comparer: @escaping (T,T) -> Bool) {
        self.comparer = comparer
    }

    func peek() -> T? {
        return nodes.first
    }

    mutating func insert(_ element: T) {
        var index = nodes.count
        nodes.append(element)

        while index > 0, !comparer(nodes[index],nodes[(index-1)/2]) {
            nodes.swapAt(index, (index-1)/2)
            index = (index-1)/2
        }
    }
 
    mutating func delete() -> T? {
        guard !nodes.isEmpty else {
            return nil
        }
 
        if nodes.count == 1 {
            return nodes.removeFirst()
        }

        let result = nodes.first
        nodes.swapAt(0, nodes.count-1)
        _ = nodes.popLast()

        var index = 0

        while index < nodes.count {
            let left = index * 2 + 1
            let right = left + 1

            if right < nodes.count {
                if comparer(nodes[left], nodes[right]),
                    !comparer(nodes[right], nodes[index]) {
                    nodes.swapAt(right, index)
                    index = right
                } else if !comparer(nodes[left], nodes[index]){
                    nodes.swapAt(left, index)
                    index = left
                } else {
                    break
                }
            } else if left < nodes.count {
                if !comparer(nodes[left], nodes[index]) {
                    nodes.swapAt(left, index)
                    index = left
                } else {
                    break
                }
            } else {
                break
            }
        }
        return result
    }
}

extension Heap where T: Comparable {
    init() {
        self.init(comparer: >)
    }
}

struct Data : Comparable {
    static func < (lhs: Data, rhs: Data) -> Bool {
        lhs.cost < rhs.cost
    }

    var cost : Int
    var node : Int
}

var file = FileIO()
let INF = 987654321
let N = file.readInt()
let E = file.readInt()
var V = Array(repeating: [(Int, Int)](), count: N + 1)
var distance = Array(repeating: INF, count: N + 1)
var v1 = 0, v2 = 0
var answer = INF

for _ in 0..<E {
    let a = file.readInt()
    let b = file.readInt()
    let c = file.readInt()
    V[a].append((b, c))
    V[b].append((a, c))
}

v1 = file.readInt()
v2 = file.readInt()

func dijkstra(_ start: Int) {
    distance[start] = 0

    var Q = Heap<Data>()
    Q.insert(Data(cost: 0, node: start))

    while !Q.isEmpty {
        let now = Q.delete()!
        let cost = -now.cost
        let cur = now.node

        for i in 0..<V[cur].count {
            let next = V[cur][i].0
            let nextCost = V[cur][i].1
            if distance[next] > cost + nextCost {
                distance[next] = cost + nextCost
                Q.insert(Data(cost: -distance[next], node: next))
            }
        }
    }
}

var flag1 = true, flag2 = true

dijkstra(1)
var route1 = distance[v1]
var route2 = distance[v2]
if route1 == INF { flag1 = false }
if route2 == INF { flag2 = false }

distance = Array(repeating: INF, count: N + 1)
dijkstra(v1)
if flag1 == true { route1 += distance[v2] }
if flag2 == true { route2 += distance[v2] }

distance = Array(repeating: INF, count: N + 1)
dijkstra(v2)
if flag1 == true { route1 += distance[N] }

distance = Array(repeating: INF, count: N + 1)
dijkstra(v1)
if flag2 == true { route2 += distance[N] }

if flag1 == false && flag2 == false {
    answer = -1
} else {
    answer = min(route1, route2)
}

if answer >= INF {
    answer = -1
}

print(answer)
