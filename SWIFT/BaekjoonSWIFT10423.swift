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
var E = [Int]()
var P = Array(repeating: 0, count: N + 1)
var V = [(Int, Int, Int)]()
var A = 0

func find(_ x: Int) -> Int {
    if P[x] == x {
        return x
    }
    P[x] = find(P[x])
    return P[x]
}

func union(_ x: Int, _ y: Int) {
    let a = find(x)
    let b = find(y)

    if a != b {
        P[a] = b
    }
}

for _ in 0..<K {
    E.append(file.readInt())
}
for i in 1...N {
    P[i] = i
}
for _ in 0..<M {
    V.append((file.readInt(), file.readInt(), file.readInt()))
}
for i in 0..<K - 1 {
    let cur = E[i]
    let nex = E[i + 1]

    union(cur, nex)
}

V.sort(by: { $0.2 < $1.2 })
var count = K
for i in 0..<V.count {
    let cur = V[i].0
    let nex = V[i].1
    let dis = V[i].2

    if find(cur) != find(nex) {
        A += dis
        union(cur, nex)
        count += 1
    }
    if count == N {
        break
    }
}

print(A)
