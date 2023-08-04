let N = Int(readLine()!)!
let queuestack = readLine()!.split(separator: " ").map { Int(String($0))! }
let element = readLine()!.split(separator: " ").map { Int(String($0))! }
let CN = Int(readLine()!)!
let C = readLine()!.split(separator: " ").map { Int(String($0))! }
var zippedQueuestack = [Int]()
var answer = ""

for i in 0..<N {
    if queuestack[i] != 1 {
        zippedQueuestack.append(element[i])
    }
}

if CN >= zippedQueuestack.count {
    for i in stride(from: zippedQueuestack.count - 1, to: -1, by: -1) {
        answer += "\(zippedQueuestack[i]) "
    }
    for i in 0..<CN - zippedQueuestack.count {
        answer += "\(C[i]) "
    }
} else {
    for i in stride(from: zippedQueuestack.count - 1, to: zippedQueuestack.count - CN - 1, by: -1) {
        answer += "\(zippedQueuestack[i]) "
    }
}

print(answer)
