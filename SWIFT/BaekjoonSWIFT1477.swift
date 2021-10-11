let NML = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = NML[0], M = NML[1], L = NML[2]
var R = [Int]()
var D = [Int]()

R = readLine()!.split(separator: " ").map { Int(String($0))! }
R.sort(by: >)
for i in 0..<N - 1 {
    D.append(R[i] - R[i + 1])
}
D.append(R[N - 1])
D.append(L - R[0])
D.sort(by: <)

var left = 1
var right = L - 1

while left <= right {
    let mid = (left + right) / 2

    var new = 0
    for i in 0..<N + 1 {
        new += D[i] / mid
        if D[i] % mid == 0 {
            new -= 1
        }
    }
    if new > M {
        left = mid + 1
    } else {
        right = mid - 1
    }
}

print(left)


