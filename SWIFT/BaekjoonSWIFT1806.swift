
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
let S = file.readInt()
let MAX = 999999999
var arr = Array(repeating: 0, count: N + 1)
var left = 0
var right = 0
var sum = 0
var result = MAX

for i in 0..<N {
    arr[i] = file.readInt()
}

sum = arr[0]
while left <= right && right < N {
    if sum < S {
        right += 1
        sum += arr[right]
    } else if sum == S {
        result = min(result, right - left + 1)
        right += 1
        sum += arr[right]
    } else if sum > S {
        result = min(result, right - left + 1)
        sum -= arr[left]
        left += 1
    }
}

if result == MAX {
    print(0)
} else {
    print(result)
}

