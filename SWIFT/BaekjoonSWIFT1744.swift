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
var num = Array(repeating: 0, count: N)
var index = N - 1
var answer = 0
var positive = 0
var negative = 0
var zero = 0

for i in 0..<N {
    num[i] = file.readInt()
    if num[i] > 0 {
        positive += 1
    } else if num[i] < 0 {
        negative += 1
    } else {
        zero += 1
    }
}

num.sort()

if positive % 2 == 0 {
    var index = 0
    while index < positive {
        if num[N - index - 1] == 1 || num[N - index - 2] == 1 {
            answer += num[N - index - 1] + num[N - index - 2]
            index += 2
        } else {
            answer += num[N - index - 1] * num[N - index - 2]
            index += 2
        }
    }
} else {
    var index = 0
    while index + 1 < positive {
        if num[N - index - 1] == 1 || num[N - index - 2] == 1 {
            answer += num[N - index - 1] + num[N - index - 2]
            index += 2
        } else {
            answer += num[N - index - 1] * num[N - index - 2]
            index += 2
        }
    }
    answer += num[N - index - 1]
}
if negative % 2 == 0 {
    var index = 0
    while index < negative {
        answer += num[index] * num[index + 1]
        index += 2
    }
} else {
    var index = 0
    while index + 1 < negative {
        answer += num[index] * num[index + 1]
        index += 2
    }
    if zero == 0 {
        answer += num[index]
    }
}

print(answer)
