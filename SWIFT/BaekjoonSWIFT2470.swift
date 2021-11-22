import Foundation

let N = Int(readLine()!)!
var liquid = readLine()!.split(separator: " ").map { Int(String($0))! }
var left = 0
var right = N - 1
var answer = (0, 0, 2100000000)

liquid.sort(by: <)
while left < right {
    let sum = liquid[left] + liquid[right]
    
    if sum < 0 {
        if abs(sum) < answer.2 {
            answer.0 = liquid[left]
            answer.1 = liquid[right]
            answer.2 = abs(sum)
        }
        left += 1
    } else if sum > 0 {
        if abs(sum) < answer.2 {
            answer.0 = liquid[left]
            answer.1 = liquid[right]
            answer.2 = abs(sum)
        }
        right -= 1
    } else {
        answer.0 = liquid[left]
        answer.1 = liquid[right]
        answer.2 = abs(sum)
        break
    }
}

print(answer.0, answer.1)
