import Foundation

// 라이노님의 FileIO
final class FileIO {
    private var buffer:[UInt8]
    private var index: Int
    
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
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
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45{ isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }
        
        return sum * (isPositive ? 1:-1)
    }
    
    @inline(__always) func readString() -> Int {
        var sum = 0
        var now = read()
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        
        while now != 10
                && now != 32 && now != 0 {
            sum += Int(now)
            now = read()
        }
        
        return sum
    }
}

struct Queue {
    var buf = [Int]()
    var pointer = 0

    mutating func push(_ X: Int) {
        buf.append(X)
    }
    mutating func pop() -> Int {
        if buf.count > pointer {
            let item = buf[pointer]
            pointer += 1
            return item
        } else {
            return -1
        }
    }
    func empty() -> Int {
        return buf.count == pointer ? 1 : 0
    }
    func size() -> Int {
        return buf.count - pointer
    }
    func front() -> Int {
        return buf.count > pointer ? buf[pointer] : -1
    }
    func back() -> Int {
        return buf.count > pointer ? buf.last! : -1
    }
}

let file = FileIO()
let N = file.readInt()
var q = Queue()
var answer = "" 

for _ in 0..<N {
    let str = file.readString()

    if str == 448 { //"push"
        q.push(file.readInt())
    } else if str == 553 { //"front"
        answer += String(q.front()) + "\n"
    } else if str == 401 { //"back"
        answer += String(q.back()) + "\n"
    } else if str == 443 { //"size"
        answer += String(q.size()) + "\n"
    } else if str == 335 {
        answer += String(q.pop()) + "\n"
    } else if str == 559 {
        answer += String(q.empty()) + "\n"
    }
}
print(answer, terminator: "")
