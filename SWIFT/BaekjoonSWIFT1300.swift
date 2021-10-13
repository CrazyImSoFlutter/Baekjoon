let N = Int(readLine()!)!
let K = Int(readLine()!)!
var left = 1
var right = K
var answer = 0

while left <= right {
    let mid = (left + right) / 2
    var sum = 0

    for i in 1...N {
        sum += min(mid / i, N)
    }
    if sum >= K {
        answer = mid
        right = mid - 1
    } else {
        left = mid + 1
    }
}
print(answer)
