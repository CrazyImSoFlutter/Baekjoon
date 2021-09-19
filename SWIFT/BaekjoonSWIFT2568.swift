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
var pole = Array(repeating: (0, 0), count: N)
var LIS = [Int]()
var answer = [Int]()
var index = [Int]()
for i in 0..<N {
    pole[i] = (file.readInt(), file.readInt())
}
pole.sort(by: { $0 < $1 })

answer.append(pole[0].1)
index.append(0)

for i in 1..<pole.count {
    let next = pole[i].1
    if answer.last! < next {
        answer.append(next)
        index.append(answer.count - 1)
    } else {
        var left = 0
        var right = answer.count - 1
        while left < right {
            let mid = (left + right) / 2
            if answer[mid] < next {
                left = mid + 1
            } else {
                right = mid
            }
        }
        answer[left] = next
        index.append(left)
    }
}

print(N - answer.count)

var cur = answer.count - 1
var ret = [Int]()
for i in stride(from: index.count - 1, through: 0, by: -1) {
    if cur == index[i] {
        cur -= 1
    } else {
        ret.append(pole[i].0)
    }
}
ret.sort()
print(ret.map { String($0) }.joined(separator: "\n"))
