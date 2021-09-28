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

func find(_ x: Int, _ parent: inout [Int]) -> Int {
    if x == parent[x] {
        return x
    }
    parent[x] = find(parent[x], &parent)
    return parent[x]
}

func union(_ x: Int, _ y: Int, _ parent: inout [Int], _ size: inout [Int]) {
    let a = find(x, &parent)
    let b = find(y, &parent)

    if a != b {
        if size[a] < size[b] {
            parent[a] = b
            size[b] += size[a]
            size[a] = 0
        } else {
            parent[b] = a
            size[a] += size[b]
            size[b] = 0
        }
    }
}

var file = FileIO()
var answer = ""

for _ in 0..<file.readInt() {
    let F = file.readInt()
    let MAX = 200200
    var map = [String: Int]()
    var parent = Array(repeating: 0, count: MAX)
    var size = Array(repeating: 1, count: MAX)
    var index = 1
    
    for i in 0..<MAX {
        parent[i] = i
    }

    for i in 0..<F {
        let friend1 = file.readString()
        let friend2 = file.readString()

        if map[friend1] == nil {
            map[friend1] = index
            index += 1
        }
        if map[friend2] == nil {
            map[friend2] = index
            index += 1
        }

        let f1Parent = find(map[friend1]!, &parent)
        let f2Parent = find(map[friend2]!, &parent)

        if f1Parent == f2Parent {
            answer += "\(max(size[f1Parent], size[f2Parent]))\n"
        } else {
            union(f1Parent, f2Parent, &parent, &size)
            answer += "\(max(size[f1Parent], size[f2Parent]))\n"
        }
    }
}
print(answer)
