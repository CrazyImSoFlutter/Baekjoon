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

struct number: Comparable {
    static func < (lhs: number, rhs: number) -> Bool {
        lhs.num > rhs.num
    }
    
    var num: Int
}

var file = FileIO()
let N = file.readInt()
var Arr = Array(repeating: 0, count: N)
var maxPQ = Heap<number>()
var minPQ = Heap<number>()
var answer = ""

for i in 0..<N {
    Arr[i] = file.readInt()
}
for i in 0..<N {
    if maxPQ.nodes.count > minPQ.nodes.count {
        minPQ.insert(number(num: -Arr[i]))
    } else {
        maxPQ.insert(number(num: Arr[i]))
    }
    if !maxPQ.isEmpty && !minPQ.isEmpty {
        if maxPQ.peek()!.num > -minPQ.peek()!.num {
            let MAX = maxPQ.peek()!.num
            let MIN = -minPQ.peek()!.num

            maxPQ.delete()
            minPQ.delete()
            maxPQ.insert(number(num: MIN))
            minPQ.insert(number(num: -MAX))
        }
    }
    answer += "\(maxPQ.peek()!.num)\n"
}
print(answer)
