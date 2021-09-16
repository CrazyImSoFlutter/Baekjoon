import Foundation 

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

import Foundation 
public struct Heap<T> { 
	var nodes: [T] = [] 
	let comparer: (T,T) -> Bool 
	var isEmpty: Bool { 
		return nodes.isEmpty 
	}

	init(comparer: @escaping (T,T) -> Bool) { 
		self.comparer = comparer 
	} 

	func peek() -> T? { 
		return nodes.first 
	} 

	mutating func insert(_ element: T) { 
		var index = nodes.count 
        nodes.append(element)

		while index > 0, !comparer(nodes[index],nodes[(index-1)/2]) { 
			nodes.swapAt(index, (index-1)/2) 
            index = (index-1)/2 
		} 
	}
 
	mutating func delete() -> T? { 
		guard !nodes.isEmpty else { 
			return nil 
		}
 
		if nodes.count == 1 { 
			return nodes.removeFirst() 
		}

		let result = nodes.first 
		nodes.swapAt(0, nodes.count-1) 	
		_ = nodes.popLast()

		var index = 0 

		while index < nodes.count { 
			let left = index * 2 + 1 
			let right = left + 1 

			if right < nodes.count { 
				if comparer(nodes[left], nodes[right]), 
					!comparer(nodes[right], nodes[index]) { 
					nodes.swapAt(right, index) 
					index = right 
				} else if !comparer(nodes[left], nodes[index]){ 
					nodes.swapAt(left, index) 
					index = left 
				} else { 
					break 
				} 
			} else if left < nodes.count { 
				if !comparer(nodes[left], nodes[index]) { 
					nodes.swapAt(left, index) 
					index = left 
				} else { 
					break 
				} 
			} else { 
				break 
			} 
		} 
		return result 
	} 
} 

extension Heap where T: Comparable { 
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
let n = file.readInt()
let m = file.readInt()
var vertex = Array(repeating: [(Int, Int)](), count: n + 1)
var edge = [(Int, Int)]()
var sum = 0
for i in 0..<m {
    let a = file.readInt()
    let b = file.readInt()
    let c = file.readInt()
    vertex[a].append((b, c))
    vertex[b].append((a, c))
    edge.append((a, b))
    sum += c
}
let s = file.readInt()
let t = file.readInt()
var distance1 = Array(repeating: Int.max, count: n + 1)
var distance2 = Array(repeating: Int.max, count: n + 1)

func dijkstra(_ distance: inout [Int], _ start: Int) {
    distance[start] = 0

    var Q = Heap<Data>()
    Q.insert(Data(cost: 0, node: start))

    while !Q.isEmpty {
        let now = Q.delete()!
        if distance[now.node] < now.cost {
            continue
        }
        for next in vertex[now.node] {
            if now.cost + next.1 < distance[next.0] {
                distance[next.0] = now.cost + next.1
                Q.insert(Data(cost: now.cost + next.1, node: next.0))
            }
        }
    }
}

dijkstra(&distance1, s)
dijkstra(&distance2, t)
var MIN = 99999999999
for i in 0..<m {
    MIN = min(MIN, distance1[edge[i].0] + distance2[edge[i].1])
    MIN = min(MIN, distance2[edge[i].0] + distance1[edge[i].1])
}

print(sum - MIN)
