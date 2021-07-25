let n = Int(readLine()!)!
var sequence = [Int]()
var answer = Array(repeating: 0, count: n)
var stack = Array(repeating: 0, count: 1)
var printAnswer = [String]()
var index = 0
var number = 1
var count = 0


for _ in 0..<n {
    let a = Int(readLine()!)!
    sequence.append(a)
}

stack.append(number)
printAnswer.append("+")
number += 1
count += 1

while count <= n * 2 {
    if stack[stack.count - 1] == sequence[index] {
        answer.append(stack.removeLast())
        index += 1
        printAnswer.append("-")
    } else if number <= n {
        stack.append(number)
        number += 1
        printAnswer.append("+")
    }
    count += 1

    if answer[answer.count - 1] == sequence[sequence.count - 1] {
        for i in printAnswer {
            print(i)
        }
        break
    } 
}

if stack[stack.count - 1] > 0 {
    print("NO")
}
