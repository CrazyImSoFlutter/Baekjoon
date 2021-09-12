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

for _ in 0..<file.readInt() {
    let N = file.readInt()
    let K = file.readInt()
    var D = Array(repeating: 0, count: N + 1)
    for i in 1...N {
        D[i] = file.readInt()
    }
    var node = Array(repeating: [Int](), count: N + 1)
    var entry = Array(repeating: 0, count: N + 1)
    for _ in 1...K {
        let start = file.readInt()
        let end = file.readInt()
        node[start].append(end)
        entry[end] += 1
    }
    let building = file.readInt()
    var q = [Int]()
    var index = 0
    var result = Array(repeating: 0, count: 1001)
    for i in 1...N {
        if entry[i] == 0 {
            q.append(i)
            result[i] = D[i]
        }
    }
    
    while index < q.count {
        let cur = q[index]
        index += 1

        for i in 0..<node[cur].count {
            let next = node[cur][i]
            result[next] = max(result[next], result[cur] + D[next])
            entry[next] -= 1

            if entry[next] == 0 {
                q.append(next)
            }
        }
    }

    print(result[building])
}
