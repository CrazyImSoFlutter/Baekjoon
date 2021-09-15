let T = Int(readLine()!)!
let n = Int(readLine()!)!
var A = readLine()!.split(separator: " ").map { Int(String($0))! }
let m = Int(readLine()!)!
var B = readLine()!.split(separator: " ").map { Int(String($0))! }
var Asum = [Int]()
var Bsum = [Int]()
var left = 0
var right = 0
var answer : UInt64 = 0

for i in 0..<n {
    var tmp = A[i]
    Asum.append(tmp)
    for j in i + 1..<n {
        tmp += A[j]
        Asum.append(tmp)
    }
}

for i in 0..<m {
    var tmp = B[i]
    Bsum.append(tmp)
    for j in i + 1..<m {
        tmp += B[j]
        Bsum.append(tmp)
    }
}

Asum.sort(by: <)
Bsum.sort(by: <)
left = 0
right = Bsum.count - 1

while left < Asum.count && right >= 0 {
    let sum = Asum[left] + Bsum[right]

    if sum < T {
        left += 1
    } else if sum == T {
        var dupLeft : UInt64 = 1
        var dupRight : UInt64 = 1

        while left < Asum.count - 1 {
            if Asum[left] == Asum[left + 1] {
                left += 1
                dupLeft += 1
            } else {
                break
            }
        }
        while right > 0 {
            if Bsum[right] == Bsum[right - 1] {
                right -= 1
                dupRight += 1
            } else {
                break
            }
        }
        answer += UInt64(dupLeft * dupRight)
        left += 1
    } else {
        right -= 1
    }
}

print(answer)
