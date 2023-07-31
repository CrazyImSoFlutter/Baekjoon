let N = Int(readLine()!)!
var A = readLine()!.split(separator: " ").map { Int(String($0))! }
var numCount = Array(repeating: 0, count: 1000001)
var stack = [Int]()
var answer = ""
var NGF = Array(repeating: -1, count: N + 1)

for i in A {
    numCount[i] += 1
}

for i in 0..<N {
    while !stack.isEmpty && numCount[A[stack.last!]] < numCount[A[i]] {
        NGF[stack.last!] = A[i]
        stack.removeLast()
    }
    stack.append(i)
}

for i in 0..<N {
    answer += "\(NGF[i]) "
}

print(answer)
