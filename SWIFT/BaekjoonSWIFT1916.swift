let N = Int(readLine()!)!
let M = Int(readLine()!)!
var village = Array(repeating: [(Int, Int)](), count: N + 1)
for _ in 0..<M {
    let tmp = readLine()!.split(separator: " ").map { Int(String($0))! }
    village[tmp[0]].append((tmp[1], tmp[2]))
}
let SE = readLine()!.split(separator: " ").map { Int(String($0))! }
let S = SE[0], E = SE[1]
var distance = Array(repeating: Int.max, count: N + 1)

struct priorityQ {
    var heap = Array(repeating: (0, 0), count: 1000001)
    var size = 0

    func getParent(_ index: Int) -> (Int, Int) {
        return heap[index / 2]
    }

    func getLeftChild(_ index: Int) -> (Int, Int) {
        return heap[index * 2]
    }

    func getRightChild(_ index: Int) -> (Int, Int) {
        return heap[index * 2 + 1]
    }

    mutating func insert(_ data: (Int, Int)) {
        size += 1
        var index = size

        while index != 1 && data.1 > getParent(index).1 {
            heap[index] = getParent(index)
            index /= 2
        }
        heap[index] = data
    }

    mutating func remove() -> Int {
        if heap.isEmpty {
            return 0
        }
        let itemNode = heap[1]
        let lastNode = heap[size]
        var index = 1
        
        size -= 1
        while index <= size {
            if index * 2 > size {
                break
            } else if index * 2 == size {
                if lastNode.1 < getLeftChild(index).1 {
                    heap[index] = getLeftChild(index)
                    index *= 2
                } else {
                    break
                }
            } else {
                let leftChildKey = getLeftChild(index).1
                let rightChildKey = getLeftChild(index).1

                if lastNode.1 < leftChildKey || lastNode.1 < rightChildKey {
                    heap[index] = leftChildKey > rightChildKey ? getLeftChild(index) : getRightChild(index)
                    index = leftChildKey > rightChildKey ? index * 2 : index * 2 + 1
                } else {
                    break
                }
            }
        }
        heap[index] = lastNode
        return itemNode.0
    }
}

func dijkstra(_ start: Int) {
    distance[start] = 0
    
    var Q = priorityQ()
    Q.insert((start, distance[start]))

    while Q.size != 0 {
        var cur = Q.heap[1].0
        var dist = Q.heap[1].1 * -1
        Q.remove()

        if distance[cur] < dist {
            continue
        }

        for i in 0..<village[cur].count {
            let next = village[cur][i].0
            let nextDist = dist + village[cur][i].1

            if nextDist < distance[next] {
                distance[next] = nextDist
                Q.insert((next, nextDist * -1))
            }
        }
    }
}

dijkstra(S)

print(distance[E])
