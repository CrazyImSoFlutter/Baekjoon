let NK = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = NK[0]
let K = NK[1]
let temperature = readLine()!.split(separator: " ").map { Int(String($0))! }
var prefixSum = Array(repeating: 0, count : temperature.count + 1)

for i in 1...temperature.count {
    prefixSum[i] += temperature[i - 1]
    prefixSum[i] += prefixSum[i - 1]
}

var leftPointer : Int = 0
var rightPointer : Int = K
var maxSum : Int = 0

while rightPointer <= temperature.count {
    let sum = prefixSum[rightPointer] - prefixSum[leftPointer]
    if leftPointer == 0 {
        maxSum = sum
    }
    
    if sum >= maxSum {
        maxSum = sum
    }
    rightPointer += 1
    leftPointer += 1
}

print(maxSum)
