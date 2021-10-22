let NK = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = NK[0], K = NK[1]
var D = Array(repeating: 0, count: K + 1)
var A = 0

D[0] = 1
for i in 1...N {
    let C = Int(readLine()!)!
    if C <= K {
        for j in C...K {
            D[j] = D[j] + D[j - C]
            D[j] = D[j] > 2147483648 ? 0 : D[j]
        }
    }
}

print(D[K])
