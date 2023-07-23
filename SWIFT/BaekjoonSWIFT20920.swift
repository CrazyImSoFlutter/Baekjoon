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

let file = FileIO()
let N = file.readInt()
let M = file.readInt()
var words = [String : (Int, Int)]()

for _ in 0..<N {
    let word = file.readString()
    
    if words[word] == nil {
        let count = word.count
        if count >= M {
            words[word] = (1, count)
        }
    } else {
        words[word]!.0 += 1
    }
}

let sorted = words.sorted(by: {
    if $0.value.0 != $1.value.0 { return $0.value.0 > $1.value.0 }
    if $0.value.1 != $1.value.1 { return $0.value.1 > $1.value.1 }
    return $0.key < $1.key
}).map { $0.key }.joined(separator: "\n")

print(sorted)
