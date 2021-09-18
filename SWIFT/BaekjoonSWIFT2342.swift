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
var command = [Int]()
var dp = Array(repeating: Array(repeating: Array(repeating: -1, count: 5), count: 5), count: 100001)

while true {
    let a = file.readInt()
    if a == 0 {
        break
    } else {
        command.append(a)
    }
}

func getValue(_ cur: Int, _ next: Int) -> Int {
    if cur == 0 {
        return 2
    }
    if cur == next {
        return 1
    }
    return 3 + (cur % 2 == next % 2 ? 1 : 0)
}

func next(_ i: Int, _ l: Int, _ r: Int) -> Int {
    if i == command.count {
        return 0
    }
    if dp[i][l][r] != -1 {
        return dp[i][l][r]
    }
    let n = command[i]
    dp[i][l][r] = 1999999999
    dp[i][l][r] = min(dp[i][l][r], next(i + 1, n, r) + getValue(l, n))
    dp[i][l][r] = min(dp[i][l][r], next(i + 1, l, n) + getValue(r, n))

    return dp[i][l][r]
}

print(next(0, 0, 0))
