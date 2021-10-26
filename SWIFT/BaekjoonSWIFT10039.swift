var score = [Int]()
var sum = 0

for i in 0..<5 {
    score.append(Int(readLine()!)!)
    if score[i] < 40 {
        score[i] = 40
    }
}

sum = score.reduce(0, +)
print(sum / 5)
