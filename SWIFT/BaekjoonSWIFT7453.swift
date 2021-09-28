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
let n = file.readInt()
var A = [Int](), B = [Int](), C = [Int](), D = [Int]()
var AB = [Int]()
var CD = [Int]()
var answer = 0

for _ in 0..<n {
    A.append(file.readInt())
    B.append(file.readInt())
    C.append(file.readInt())
    D.append(file.readInt())
}

for i in 0..<n {
    for j in 0..<n {
        AB.append(A[i] + B[j])
        CD.append(C[i] + D[j])
    }
}
AB.sort()
CD.sort()

var left = 0
var right = CD.count - 1

while left < AB.count && right >= 0 {
    if AB[left] + CD[right] > 0 {
        right -= 1
    } else if AB[left] + CD[right] < 0 {
        left += 1
    } else {
        let tmp = left
        var l = 0
        var r = 0
        
        while AB[left] + CD[right] == 0 {
            l += 1
            left += 1
            if left >= AB.count {
                break
            }
        }
        while AB[tmp] + CD[right] == 0 {
            r += 1
            right -= 1
            if right < 0 {
                break
            }
        }
        answer += (l * r)
    }
}

print(answer)
