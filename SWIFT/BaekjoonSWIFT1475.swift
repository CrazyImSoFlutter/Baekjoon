import Foundation

let number = readLine()!.map { Int(String($0))! }
var plasticSet = Array(repeating: 0, count: 10)
var answer = 0

for i in number {
    plasticSet[i] += 1
}

for i in 0..<10 {
    if i == 6 || i == 9 {
        let sixAndNine = plasticSet[6] + plasticSet[9]
        answer = answer <= Int(ceil(Double(sixAndNine) / 2.0)) ? Int(ceil(Double(sixAndNine) / 2.0)) : answer
    } else {
        answer = answer <= plasticSet[i] ? plasticSet[i] : answer
    }
    
}

print(answer)
