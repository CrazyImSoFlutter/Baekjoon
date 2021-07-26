let N = Int(readLine()!)!
var A = readLine()!.split(separator: " ").map { Int(String($0))! }
var stack = [Int]()

for i in 0..<N {
  while !stack.isEmpty && A[stack.last!] < A[i]{
    A[stack.removeLast()] = A[i]
  }
  stack.append(i)
}

for i in stack {
  A[i] = -1
}

print(A.map { String($0) }.joined(separator: " "))
