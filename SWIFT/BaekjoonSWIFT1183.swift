let N = Int(readLine()!)!
var A = [(Int)]()

for _ in 0..<N {
    let tmp = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    A.append(tmp[0] - tmp[1])
}
A.sort(by: < )

if N % 2 == 1 {
    print(1)
} else {
    print(abs(A[N / 2] - A[N / 2 - 1]) + 1)
}
