let str = readLine()!.map { String($0) }
let bomb = readLine()!.map { String($0) }
var answer = [String]()

for i in str {
    answer.append(i)
    if i == bomb.last {
        if bomb.count <= answer.count {
            var check = true
            for i in 0..<bomb.count {
                if bomb[bomb.count - 1 - i] != answer[answer.count - 1 - i] {
                    check = false
                    break
                }
            }
            if check {
                for _ in 0..<bomb.count {
                    answer.removeLast()
                }
            }
        }
    }
}

if answer.isEmpty {
    print("FRULA")
} else {
    var answerString = ""
    for i in 0..<answer.count {
        answerString += answer[i]
    }
    print(answerString)
}
