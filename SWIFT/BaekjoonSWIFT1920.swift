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
var A = Array(repeating: 0, count: N)
for i in 0..<N {
    A[i] = file.readInt()
}
let M = file.readInt()
var X = Array(repeating: 0, count: M)
for i in 0..<M {
    X[i] = file.readInt()
}
var answer = ""

A.sort()

func binarySearch(_ target: Int) -> Bool {
    var start = 0
    var end = A.count - 1
    var mid = (end + start) / 2

    while (end - start) >= 0 {
        if A[mid] == target {
            return true
        } else if A[mid] <= target {
            start = mid + 1
        } else {
            end = mid - 1
        }
        mid = (end + start) / 2
    }
    return false
}

for i in X {
    if binarySearch(i) {
        answer += "1\n"
    } else {
        answer += "0\n"
    }
}
print(answer)
