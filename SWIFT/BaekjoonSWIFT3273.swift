let n = Int(readLine()!)!
var a = readLine()!.split(separator: " ").map { Int(String($0))! }
let x = Int(readLine()!)!
var left = 0
var right = a.count - 1
var answer = 0

a.sort(by: <)

while left < right {
    let sum = a[left] + a[right]

    if sum > x {
        right -= 1
    } else if sum < x {
        left += 1
    } else {
        answer += 1
        left += 1
    }
}

print(answer)
