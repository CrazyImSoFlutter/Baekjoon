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
var info = Array(repeating: [(Int, Int)](), count: N + 1)
var distance = Array(repeating: INF, count: N + 1)
var v1 = 0, v2 = 0
var answer = Int.max

for _ in 0..<E {
    let a = file.readInt()
    let b = file.readInt()
    let c = file.readInt()
    info[a].append((b, c))
    info[b].append((a, c))
}

v1 = file.readInt()
v2 = file.readInt()

func dijkstra(_ start: Int) {
    distance[start] = 0

    var Q = Heap<Data>()
    Q.insert(Data(cost: 0, node: start))

    while !Q.isEmpty {
        let now = Q.delete()!
        if distance[now.node] < now.cost {
            continue
        }
        for next in info[now.node] {
            if now.cost + next.1 < distance[next.0] {
                distance[next.0] = now.cost + next.1
                Q.insert(Data(cost: now.cost + next.1, node: next.0))
            }
        }
    }
}

dijkstra(1)
let startToV1 = distance[v1]
let startToV2 = distance[v1]

distance = Array(repeating: INF, count: N + 1)

dijkstra(v1)
let V1ToV2 = distance[v2]
let V1ToN = distance[N]

distance = Array(repeating: INF, count: N + 1)

dijkstra(v2)
let V2ToN = distance[N]

answer = min(answer, startToV1 + V1ToV2 + V2ToN)
answer = min(answer, startToV2 + V1ToV2 + V1ToN)

if V1ToV2 == INF || answer >= INF {
    print(-1)
} else {
    print(answer)
}
