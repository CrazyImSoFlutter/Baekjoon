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
var N = file.readInt()
var able = Array(repeating: 0, count: N)
var crane = Array(repeating: 0, count: N)
for i in 0..<N {
    crane[i] = file.readInt()
}
var M = file.readInt()
var box = Array(repeating: 0, count: M)
for i in 0..<M {
    box[i] = file.readInt()
}

var answer = 0
var index = 0

crane.sort(by:>)
box.sort(by:>)

if box[0] > crane[0] {
    answer = -1
}
for i in 0..<num {
    if crane[index] >= box[i] {
        able[index] += 1
    } else {
        index += 1
        i -= 1
    }
}
while true {
    for i in 
}

print(answer)
