let A = Int(readLine()!)!
let B = Int(readLine()!)!
let C = Int(readLine()!)!
var result = A * B * C
var arr = [Int]()
var counter = [Int : Int]()
var answer = Array(repeating: 0, count: 10)

while result > 0 {
    arr.append(result % 10)
    result = result / 10
}

arr.forEach{ counter[$0, default: 0] += 1 }

for i in counter {
    for j in 0...9 {
        if i.key == j {
            answer[j] = i.value
        }
    }
}

for i in 0...9 {
    print(answer[i])
}
