import Foundation

let NK = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = NK[0]
let K = NK[1]
var answerArray = [Int]()

for i in 1...Int(sqrt(Double(N))) {
    if N % i == 0 {
        answerArray.append(i)
        if i != N / i {
            answerArray.append(N / i)
        }
    }
}

let sortedArray = answerArray.sorted(by: <)

if sortedArray.count < K {
    print (0)
} else {
    print(sortedArray[K - 1])
}
