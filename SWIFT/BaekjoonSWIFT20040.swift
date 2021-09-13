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
let n = file.readInt()
let m = file.readInt()
var parent = [Int]()
var visit = Array(repeating: false, count: n)
var flag = true

for i in 0...n {
    parent.append(i)
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

for i in 1...m {
    let a = file.readInt()
    let b = file.readInt()

    if findParent(a) == findParent(b) {
        print(i)
        flag = false
        break
    }
    makeUnion(a, b)
}

if flag {
    print(0)
}
