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
var NArr = [Int]()
var NSet = Set<Int>()
var sortedNArr = [(Int, Int)]()
var index = -1
for _ in 0..<N {
    NArr.append(file.readInt())
}
NArr.sort()

for i in 0..<N {
    if NSet.contains(NArr[i]) {
        sortedNArr[index].1 += 1
    } else {
        sortedNArr.append((NArr[i], 1))
        NSet.insert(NArr[i])
        index += 1
    }
}
let M = file.readInt()
var MArr = [Int]()
for _ in 0..<M {
    MArr.append(file.readInt())
}

var answer = ""
for i in MArr {
    if NSet.contains(i) {
        answer += "\(sortedNArr[binarySearch(i)].1) "
    } else {
        answer += "0 "
    }
}
print(answer)

func binarySearch(_ target: Int) -> Int {
    var start = 0
    var end = sortedNArr.count - 1
    var mid = (end + start) / 2

    while (end - start) >= 0 {
        if sortedNArr[mid].0 == target {
            return mid
        } else if sortedNArr[mid].0 <= target {
            start = mid + 1
        } else {
            end = mid - 1
        }
        mid = (end + start) / 2
    }
    return -1
}

