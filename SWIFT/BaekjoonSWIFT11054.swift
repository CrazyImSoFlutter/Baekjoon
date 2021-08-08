let N = Int(readLine()!)!
let A = readLine()!.split(separator: " ").map { Int(String($0))! }
var forward = Array(repeating: 0, count: N)
var reverse = Array(repeating: 0, count: N)
var maxValue = 1

for i in 0..<N {
    forward[i] = 1
    reverse[N - i - 1] = 1
    for j in 0..<i {
        if A[j] < A[i] && forward[j] + 1 > forward[i] {
            forward[i] = forward[j] + 1
        }
        if A[N - 1 - j] < A[N - 1 - i] && reverse[N - 1 - j] + 1 > reverse[N - 1 - i] {
            reverse[N - 1 - i] = reverse[N - 1 - j] + 1
        }

    }
}

for i in 0..<N {
    maxValue = max(maxValue, forward[i] + reverse[i])
}

print(maxValue - 1)
