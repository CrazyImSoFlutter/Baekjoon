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

let file = FileIO()
let N = file.readInt()
var arr = Array(repeating: 0, count: 3000010)
var top = 1500000
var bottom = 1500000

for _ in 0..<N {
    let com = file.readInt()
    if com == 1 {
        top -= 1
        arr[top] = file.readInt()
    } else if com == 2 {
        arr[bottom] = file.readInt()
        bottom += 1
    } else if com == 3 {
        if bottom - top > 0  {
            print(arr[top])
            top += 1
        } else {
            print(-1)
        }
    } else if com == 4 {
        if bottom - top > 0 {
            bottom -= 1
            print(arr[bottom])
        } else {
            print(-1)
        }
    } else if com == 5 {
        print(bottom - top)
    } else if com == 6 {
        print(bottom - top > 0 ? 0 : 1)
    } else if com == 7 {
        print(bottom - top > 0 ? arr[top] : -1)
    } else if com == 8 {
        print(bottom - top > 0 ? arr[bottom - 1] : -1)
    }
}
