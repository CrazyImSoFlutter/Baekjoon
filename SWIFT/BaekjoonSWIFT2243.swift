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
let MAX = 1000000
let N = file.readInt()
var command = [(Int, Int, Int)]()
var tree = Array(repeating: 0, count: 1 << 21)
var leaf = 0;

for _ in 0..<N {
    let a = file.readInt()
    
    if a == 1 {
        let b = file.readInt()
        command.append((a, b, -1))
    } else if a == 2 {
        let b = file.readInt()
        let c = file.readInt()
        command.append((a, b, c))
    }
}

func update(_ i: Int, _ diff: Int) {
    var j = i
    
    j += leaf
    tree[j] += diff
    while (j > 1) {
        j /= 2
        tree[j] = tree[j * 2] + tree[j * 2 + 1]
    }
}

func find(_ node: Int, _ s: Int, _ e: Int, _ remain: Int) -> Int {
    if s == e {
        return s
    }
    let mid = (s + e) / 2
    let left = tree[node * 2]
    if remain > left {
        return find(node * 2 + 1, mid + 1, e, remain - left)
    } else {
        return find(node * 2, s, mid, remain)
    }
}

leaf = 1 << 20
var pos = 0

for i in 0..<N {
    if command[i].0 == 1 {
        pos = find(1, 0, leaf - 1, command[i].1)
        print(pos + 1)
        update(pos, -1)
    } else {
        update(command[i].1 - 1, command[i].2)
    }
}
