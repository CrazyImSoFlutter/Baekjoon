var num = Array(repeating: 0, count: 5)
num[0] = Int(readLine()!)!
num[1] = Int(readLine()!)!
num[2] = Int(readLine()!)!
num[3] = Int(readLine()!)!
num[4] = Int(readLine()!)!
var sum : Int = 0

let sortedNum = num.sorted(by: <)
sortedNum.map { sum += $0 }

print(sum / 5)
if sortedNum.count % 2 == 0 {
    print((sortedNum[sortedNum.count / 2 - 1] + sortedNum[sortedNum.count / 2]) / 2)
} else {
    print(sortedNum[sortedNum.count / 2])
}
