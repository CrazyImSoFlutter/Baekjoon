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

struct deque {
    var rear = 0
    var front = 0
    var count = 0
    var MAX = 10001
    var data = Array(repeating: 0, count: 10001)

    mutating func initDeque() {
        front = 0
        rear = 0
        count = 0
    }

    func isEmpty() -> Int {
        return front == rear ? 1 : 0
    }

    func isFull() -> Int {
        return (rear + 1) % MAX == front ? 1 : 0
    }

    mutating func addFront(_ num : Int) {
        if isFull() == 1 {
            return
        }
        count += 1
        data[front] = num
        front = (front - 1 + MAX) % MAX
    }

    mutating func addRear(_ num : Int) {
        if isFull() == 1 {
            return
        }
        count += 1
        rear = (rear + 1) % MAX
        data[rear] = num
    }

    mutating func deleteFront() -> Int {
        if isEmpty() == 1 {
            return -1
        }
        let tmp = data[(front + 1) % MAX]
        front = (front + 1) % MAX
        count -= 1
        return tmp
    }

    mutating func deleteRear() -> Int {
        if isEmpty() == 1 {
            return -1
        }
        let tmp = data[rear]
        rear = (rear - 1 + MAX) % MAX
        count -= 1
        return tmp
    }

    func size() -> Int {
        return count
    }
}

let file = FileIO()
var N = file.readInt()
var d = deque()

d.initDeque()

for _ in 0..<N {
    let str = file.readString()

    if str == 1096 { //push_front
        let X = file.readInt()
        d.addFront(X)
    } else if str == 944 { //push_back
        let X = file.readInt()
        d.addRear(X)
    } else if str == 983 { //pop_front
        print(d.deleteFront())
    } else if str == 831 { //pop_back
        print(d.deleteRear())
    } else if str == 443 { //size
        print(d.size())
    } else if str == 559 { //empty
        print(d.isEmpty())
    } else if str == 553 { //front
        if d.isEmpty() == 1 {
            print(-1)
        } else {
            print(d.data[(d.front + 1) % d.MAX])
        }
    } else if str == 401 { //back
        if d.isEmpty() == 1 {
            print(-1)
        } else {
            print(d.data[d.rear])
        }
    }
}
