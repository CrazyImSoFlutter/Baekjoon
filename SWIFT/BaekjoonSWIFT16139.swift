import Foundation

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

let file = FileIO()
var S = Array(file.readString())
var q = file.readInt()
var memo = [String: [Int]]()
var answer = ""

for i in 97...122 {
    var sumArray = Array(repeating: 0, count: S.count)
    if Character(String(S[0])).asciiValue! == i {
        sumArray[0] = 1
    }
    for j in 1..<S.count{
        if Character(String(S[j])).asciiValue! == i {
            sumArray[j] += (1 + sumArray[j - 1])
        }else{
            sumArray[j] = sumArray[j - 1]
        }
    }
    memo[String(UnicodeScalar(i)!)] = sumArray
}

for _ in 0..<q {
    let a = file.readString()
    let l = file.readInt()
    let r = file.readInt()

    let tmp = memo[a]!
    if l == 0{
        answer += "\(tmp[r])\n"
    } else {
        answer += "\(tmp[r] - tmp[l - 1])\n"
    }
}
print(answer)
