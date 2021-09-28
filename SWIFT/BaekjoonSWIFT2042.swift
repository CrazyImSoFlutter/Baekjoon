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
let K = file.readInt()
var A = Array(repeating: 0, count: N)
var C = Array(repeating: (0, 0, 0), count: M + K)
var S = Array(repeating: 0, count: N)

for i in 0..<N {
    A[i] = file.readInt()
}
for i in 0..<M + K {
    C[i] = (file.readInt(), file.readInt(), file.readInt())
}

func segTree(_ node: Int, _ start: Int, _ end: Int) -> Int {
    if start == end {
        S[node] = A[start]
        return S[node]
    }

    let mid = (start + end) / 2
    let left = segTree(node * 2, start, mid)
    let right = segTree(node * 2 + 1, mid + 1, end)

    S[node] = left + right
    return S[node]
}

func update(_ node: Int, _ start: Int, _ end: Int, _ index: Int, _ num: Int) -> Int {
    if index < start || end < index {
        return S[node]
    }
    if start == end {
        S[node] = num
        return S[node]
    }

    let mid = (start + end) / 2
    let left = update(node * 2, start, mid, index, num)
    let right = update(node * 2 + 1, mid + 1, end, index, num)
    
    S[node] = left + right
    return S[node]
}

func sum(_ node: Int, _ start: Int, _ end: Int, _ left: Int, _ right: Int) -> Int {
    if left > end || right < start {
        return 0
    }
    if left <= start && end <= right {
        return S[node]
    }

    let mid = (start + end) / 2
    let leftResult = sum(node * 2, start, mid, left, right)
    let rightResult = sum(node * 2 + 1, mid + 1, end , left, right)
    return leftResult + rightResult
}

let treeH = Int(ceil(log2(Double(N))))
let treeS = 1 << (treeH + 1)

S = Array(repeating: 0, count: treeS)
segTree(1, 0, N - 1)

for i in 0..<C.count {
    let cmd = C[i].0

    if cmd == 1 {
        let idx = C[i].1 - 1
        let num = C[i].2
        update(1, 0, N - 1, idx, num)
    } else {
        let idx = C[i].1 - 1
        let idx2 = C[i].2 - 1

        print(sum(1, 0, N - 1, idx, idx2))
    }
}
