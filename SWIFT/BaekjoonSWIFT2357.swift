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

var file = FileIO()
let N = file.readInt()
let M = file.readInt()
var A = [Int]()
var minTree = [Int]()
var maxTree = [Int]()
var answer = ""

func segTree(_ node: Int, _ start: Int, _ end: Int) {
    if start == end {
        minTree[node] = A[start]
        maxTree[node] = A[start]
    } else {
        let mid = (start + end) / 2
        segTree(node * 2, start, mid)
        segTree(node * 2 + 1, mid + 1, end)
        minTree[node] = min(minTree[node * 2], minTree[node * 2 + 1])
        maxTree[node] = max(maxTree[node * 2], maxTree[node * 2 + 1])
    }
}

func find(_ node: Int, _ a: Int, _ b: Int, _ left: Int, _ right: Int) -> (Int, Int) {
    if left > b || right < a {
        return (Int.max, 0)
    }
    if a <= left && right <= b {
        return (minTree[node], maxTree[node])
    }
    let mid = (left + right) / 2
    let left = find(node * 2, a, b, left, mid)
    let right = find(node * 2 + 1, a, b, mid + 1, right)
    return (min(left.0, right.0), max(left.1, right.1))
}

let treeH = Int(ceil(log2(Double(N))))
let treeS = 1 << (treeH + 1)
minTree = Array(repeating: 0, count: treeS)
maxTree = Array(repeating: 0, count: treeS)

for _ in 0..<N {
    A.append(file.readInt())
}
segTree(1, 0, N - 1)
for _ in 0..<M {
    let v = find(1, file.readInt() - 1, file.readInt() - 1, 0, N - 1)
    answer += "\(v.0) \(v.1)\n"
}
print(answer)
