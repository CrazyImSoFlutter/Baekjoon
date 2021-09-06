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
    let n = file.readInt()
    var sticker = Array(repeating: Array(repeating: 0, count: n), count : 2)
    var dp = Array(repeating: Array(repeating: 0, count: n), count : 2)

    for i in 0..<2 {
        for j in 0..<n {
            sticker[i][j] = file.readInt()
        }
    }

    if n == 1 {
        print(max(sticker[0][0], sticker[1][0]))
    } else {
        dp[0][0] = sticker[0][0]
        dp[1][0] = sticker[1][0]
        dp[0][1] = dp[1][0] + sticker[0][1]
        dp[1][1] = dp[0][0] + sticker[1][1]
        for i in 2..<n {
            dp[0][i] = max(dp[1][i - 1], dp[1][i - 2]) + sticker[0][i]
            dp[1][i] = max(dp[0][i - 1], dp[0][i - 2]) + sticker[1][i]
        }
        
        print(max(dp[0][n - 1], dp[1][n - 1]))
    }
}
