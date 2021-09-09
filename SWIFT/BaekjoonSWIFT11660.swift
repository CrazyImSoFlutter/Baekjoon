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
let M = file.readInt()
var answer = Array(repeating: Array(repeating: 0, count: N + 1), count: N + 1)
var answerStr = ""

for i in 0..<N {
    for j in 0..<N {
        let tmp = file.readInt()
        answer[i + 1][j + 1] = answer[i][j + 1] + answer[i + 1][j] - answer[i][j] + tmp
    }
}
for i in 0..<M {
    let loc = (file.readInt(), file.readInt(), file.readInt(), file.readInt())

    answerStr += "\(answer[loc.2][loc.3] - answer[loc.0 - 1][loc.3] - answer[loc.2][loc.1 - 1] + answer[loc.0 - 1][loc.1 - 1])\n"
}
print(answerStr)
