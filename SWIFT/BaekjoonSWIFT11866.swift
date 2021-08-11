let NK = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = NK[0]
let K = NK[1]
var NArr = [Int]()
var answer = [Int]()
var index = -1

for i in 1...N {
    NArr.append(i)
}

while true {
    index = (index + K) % NArr.count
    answer.append(NArr[index])
    NArr.remove(at: index)
    if NArr.count == 0 {
        break
    }
    index = (index - 1 + NArr.count) % NArr.count
}

print("<\(answer.map { String($0) }.joined(separator: ", "))>")
