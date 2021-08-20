import Foundation

let N = Int(readLine()!)!
var word = Array(repeating: "", count: N)
var wordArray = Array(repeating: [Character](), count: N)
var number = [(Character, Int)]()

for i in 0..<N {
    word[i] = readLine()!
    for j in word[i] {
        wordArray[i].append(j)
        if number.contains(where: {$0 == (j, 0)}) {
            continue
        }
        number.append((j, 0))
    }
    wordArray[i].reverse()
}
for i in 0..<N {
    for j in 0..<wordArray[i].count {
        number[number.firstIndex(where: { $0.0 ==  wordArray[i][j] })!].1 += Int(pow(Double(10), Double(j)))
    }
}
number.sort(by: { $0.1 > $1.1 })

var answer = Array(repeating: 0, count: N)
for i in 0..<N {
    for j in stride(from: wordArray[i].count - 1, through: 0, by: -1) {
        answer[i] *= 10
        answer[i] += 9 - number.firstIndex(where: { $0.0 == wordArray[i][j] })!
    }
}

print(answer.reduce(0, +))
