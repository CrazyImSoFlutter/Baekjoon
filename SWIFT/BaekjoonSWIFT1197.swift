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
let V = file.readInt()
let E = file.readInt()
var parent = Array(repeating: 0, count: V + 1)
var vertex = [(Int, Int, Int)]()
var answer = 0
var MAX = 0

for _ in 0..<E {
    let F = file.readInt()
    let T = file.readInt()
    let C = file.readInt()

    vertex.append((F, T, C))
}

vertex.sort(by: { $0.2 < $1.2 })

for i in 1...V {
    parent[i] = i
}


func findParent(_ a: Int) -> Int {
    if a == parent[a] {
        return a
    } else {
        parent[a] = findParent(parent[a])
        return parent[a]
    }
}

func makeUnion(_ a: Int, _ b: Int) {
    let pa = findParent(a);
    let pb = findParent(b);

    if pa > pb {
        parent[pa] = pb
    } else if pa < pb {
        parent[pb] = pa
    }
}

func checkParent(_ a: Int, _ b: Int) -> Bool {
    let x = findParent(a)
    let y = findParent(b)

    if x == y {
        return true
    } else {
        return false
    }
}

for i in 0..<E {
    if !checkParent(vertex[i].0, vertex[i].1) {
        makeUnion(vertex[i].0, vertex[i].1)
        answer += vertex[i].2
        MAX = max(MAX, vertex[i].2)
    }
}

print(answer - MAX)
