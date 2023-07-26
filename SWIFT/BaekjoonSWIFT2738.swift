let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
var A = Array(repeating: Array(repeating: 0, count: NM[0]), count: NM[1])
var B = Array(repeating: Array(repeating: 0, count: NM[0]), count: NM[1])

for i in 0..<NM[0] {
    let num = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    for j in 0..<NM[0] {
        A[i][j] = num[j]
    }
}

for i in 0..<NM[0] {
    let num = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    for j in 0..<NM[0] {
        B[i][j] = num[j]
    }
}

for i in 0..<NM[0] {
    for j in 0..<NM[0] {
        print(A[i][j] + B[i][j], terminator: " ")
    }
    print()
}
