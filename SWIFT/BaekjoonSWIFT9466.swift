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

var student = [Int]()
var visit = [Bool]()
var check = [Bool]()
var count = 0

func DFS(_ index: Int) {
    let next = student[index]
    visit[index] = true
    if !visit[next] {
        DFS(next)
    } else {
        if !check[next] {
            var i = next
            while i != index {
                count += 1
                i = student[i]
            }
            count += 1
        }
    }
    check[index] = true
}

var file = FileIO()

for _ in 0..<file.readInt() {
    let n = file.readInt()
    student = Array(repeating: 0, count: n + 1)
    visit = Array(repeating: false, count: n + 1)
    check = Array(repeating: false, count: n + 1)
    for i in 1...n {
        student[i] = file.readInt()
    }
    count = 0
    for i in 1...n {
        if !visit[i] {
            DFS(i)
        }
    }
    print(n - count)
}
