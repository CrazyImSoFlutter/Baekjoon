let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = NM[0], M = NM[1]
let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }
var modCount = Array(repeating: 0, count: 1001)
var sum = 0
var answer = 0

for i in numbers {
    sum += i
    modCount[sum % M] += 1
}

for i in modCount {
    answer += i * (i - 1) / 2
}

print(modCount[0] + answer)
