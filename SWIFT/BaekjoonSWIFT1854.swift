import Foundation 

// 라이노님의 FileIO
final class FileIO {
    private var buffer:[UInt8]
    private var index: Int
    
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
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
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45{ isPositive.toggle(); now = read() } // 음수 처리
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
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        
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

struct Distance : Comparable {
    static func < (lhs: Distance, rhs: Distance) -> Bool {
        lhs.dist > rhs.dist
    }
    var dist : Int
}

var file = FileIO()
let n = file.readInt()
let m = file.readInt()
let k = file.readInt()
var edge = Array(repeating: [(Int, Int)](), count: 1001)
var distance = Array(repeating: Heap<Distance>(), count: 1001)
var pq = Heap<Data>()

for i in 0..<m {
    edge[file.readInt()].append((file.readInt(), file.readInt()))
}

pq.insert(Data(cost: 0, node: 1))
distance[1].insert(Distance(dist: 0))

while (!pq.isEmpty) {
    var data = pq.delete()!

    for i in 0..<edge[data.node].count {
        var next = edge[data.node][i].0
        var nextCost = edge[data.node][i].1

        if distance[next].nodes.count < k {
            distance[next].insert(Distance(dist: nextCost + data.cost))
            pq.insert(Data(cost: nextCost + data.cost, node: edge[data.node][i].0))
        } else if distance[next].peek()!.dist > nextCost + data.cost {
            distance[next].delete()
            distance[next].insert(Distance(dist: nextCost + data.cost))
            pq.insert(Data(cost: nextCost + data.cost, node: edge[data.node][i].0))
        }
    }
}
for i in 1...n {
    distance[i].nodes.count == k ? print(distance[i].peek()!.dist) : print(-1)
}
