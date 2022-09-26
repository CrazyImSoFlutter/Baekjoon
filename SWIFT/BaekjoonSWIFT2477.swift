let K = Int(readLine()!)!
var L = [Int]()
var index = 0

for _ in 0..<6 {
    let DL = readLine()!.split(separator: " ").map { Int(String($0))! }

    L.append(DL[1])
}

for i in 0..<6 {
    if L[index] <= L[i] {
        index = i
    }
}

if L[(index + 5) % 6] > L[(index + 1) % 6] {
    print((L[index] * L[(index + 5) % 6] - L[(index + 2) % 6] * L[(index + 3) % 6]) * K)
} else {
    print((L[index] * L[(index + 1) % 6] - L[(index + 3) % 6] * L[(index + 4) % 6]) * K)
}
