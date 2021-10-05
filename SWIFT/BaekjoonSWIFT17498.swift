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
let INF = 10000000000
let N = file.readInt()
let M = file.readInt()
let D = file.readInt()
var F = Array(repeating: [Int](), count: N)
var dp = Array(repeating: Array(repeating: -INF, count: M), count: N)
var answer = -INF
for i in 0..<N {
    for _ in 0..<M {
        F[i].append(file.readInt())
    }
}

func check(_ y: Int, _ x: Int) -> Bool {
    if y < 0 || y >= N || x < 0 || x >= M {
        return false
    } else {
        return true
    }
}

func jump(_ Y: Int, _ X: Int) -> Int {
    if Y * X >= N * M {
        return -INF
    }
    if Y == N - 1 {
        return 0
    }
    if dp[Y][X] != -INF {
        return dp[Y][X]
    }
    for i in Y...Y + D {
        for j in X - D...X + D {
            if check(i, j) && Y < i && abs(i - Y) + abs(j - X) <= D {
                dp[Y][X] = max(dp[Y][X], F[Y][X] * F[i][j] + jump(i, j))
            }
        }
    }
    return dp[Y][X]
}

for i in 0..<M {
    answer = max(answer, jump(0, i))
}
print(answer)
