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
var arr = Array(repeating: 0, count: N + 1)
for i in 1...N {
    arr[i] = file.readInt()
}
let M = file.readInt()
var quest = Array(repeating: (0, 0), count: M + 1)
for i in 0..<M {
    quest[i] = (file.readInt(), file.readInt())
}
var dp = Array(repeating: Array(repeating: 0, count: N + 1), count: N + 1)

for i in 1...N {
    dp[i][i] = 1
}

for i in 1...N - 1 {
    if arr[i] == arr[i + 1] {
        dp[i][i + 1] = 1
    }
}

for i in stride(from: N - 1, through: 1, by: -1) {
    for j in stride(from: i + 2, through: N, by: 1) {
        if arr[i] == arr[j] && dp[i + 1][j - 1] == 1 {
            dp[i][j] = 1
        }
    }
}

var answer = ""
for i in 0..<M {
    answer += "\(dp[quest[i].0][quest[i].1])\n"
}
print(answer)
