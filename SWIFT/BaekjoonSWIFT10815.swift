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

func binarySearch(array: [Int], value: Int) -> Int {
    var start = 0
    var end = array.count - 1
    var mid = (start + end) / 2

    while (end - start) >= 0 {
        if array[mid] == value {
            return 1
        } else if array[mid] < value {
            start = mid + 1
        } else {
            end = mid - 1
        }
        mid = (start + end) / 2
    }
    return 0
}

var file = FileIO()
let N = file.readInt()
var A = Array(repeating: 0, count: N)
for i in 0..<N {
    A[i] = file.readInt()
}
var M = file.readInt()
var B = Array(repeating: 0, count: M)
for i in 0..<M {
    B[i] = file.readInt()
}

A.sort()
for i in 0..<M {
    print(binarySearch(array: A, value: B[i]), terminator: " ")
}
