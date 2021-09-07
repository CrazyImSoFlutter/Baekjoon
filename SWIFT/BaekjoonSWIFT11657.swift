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

let MAX = 99999999
let MIN = -99999999
var file = FileIO()
let N = file.readInt(), M = file.readInt()
var MArr = Array(repeating: (0, 0, 0), count: M + 1)
var dist = Array(repeating: MAX, count: N + 1)
var flag = true
var answer = ""

for i in 1...M {
    let start = file.readInt()
    let dest = file.readInt()
    let cost = file.readInt()

    MArr[i] = (start, dest, cost)
}

dist[1] = 0
for i in 1...N - 1 {
    for j in 1...M {
        let u = MArr[j].0
        let v = MArr[j].1
        let w = MArr[j].2
        
        if dist[u] != MAX && dist[u] + w < dist[v] {
            dist[v] = dist[u] + w
        }
    }
}

for i in 0..<M {
    let u = MArr[i].0
    let v = MArr[i].1
    let w = MArr[i].2

    if dist[u] != MAX && dist[u] + w < dist[v] {
        dist[v] = MIN
    }
}

for i in 2...N {
    if dist[i] == MIN {
        flag = false
        break
    } 
}

if flag {
    for i in 2...N {
        if dist[i] == MAX {
            answer += "\(-1)\n"
        } else {
            answer += "\(dist[i])\n"
        }
    }
} else {
    answer = "-1"
}
print(answer)
