import Foundation

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
var trees = [Int]()
let N = file.readInt()
var X = Array(repeating: 0, count: N)
var Y = Array(repeating: 0, count: N)
var sortedX = Array(repeating: 0, count: N)
var sortedY = Array(repeating: 0, count: N)
var fence = Array(repeating: 0, count: N)
var answer = 9876543210


for i in 0..<N {
    X[i] = file.readInt()
    Y[i] = file.readInt()
    fence[i] = file.readInt()
    sortedX[i] = X[i]
    sortedY[i] = Y[i]
}

sortedX.sort(by: <)
sortedY.sort(by: <)

var innerTree = [Int]()

for wa in 0..<N {
    for wb in wa..<N {
        for ha in 0..<N {
            for hb in ha..<N {
                var count = 0, innerTreeSum = 0, outerTreeSum = 0
                let requiredFence = 2 * (sortedX[wb] - sortedX[wa] + sortedY[hb] - sortedY[ha])
                
                for i in 0..<N {
                    if X[i] >= sortedX[wa] && X[i] <= sortedX[wb] && Y[i] >= sortedY[ha] && Y[i] <= sortedY[hb] {
                        count += 1
                        innerTree.append(fence[i])
                        innerTreeSum += fence[i]
                    } else {
                        outerTreeSum += fence[i]
                    }
                }
                
                if outerTreeSum >= requiredFence {
                    answer = min(answer, N - count)
                } else {
                    if outerTreeSum + innerTreeSum >= requiredFence {
                        innerTree.sort(by: >)
                        for i in 0..<innerTree.count {
                            count -= 1
                            outerTreeSum += innerTree[i]
                            if outerTreeSum >= requiredFence {
                                answer = min(answer, N - count)
                                break
                            }
                        }
                    }
                }
                innerTree.removeAll()
            }
        }
    }
}

print(answer)
