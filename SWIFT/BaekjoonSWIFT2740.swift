let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = NM[0], M = NM[1]
var A = Array(repeating: [Int](), count: N)

for i in 0..<N {
    A[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
}

let MK = readLine()!.split(separator: " ").map { Int(String($0))! }
let K = MK[1]
var B = Array(repeating: [Int](), count: M)

for i in 0..<M {
    B[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
}

for i in 0..<N {
    for j in 0..<K {
        var sum = 0
        for k in 0..<M {
            sum += A[i][k] * B[k][j]
        }
        print("\(sum) ", terminator: "")
    }
    print("")
}

