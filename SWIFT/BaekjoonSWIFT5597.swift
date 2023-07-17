var student = Array(repeating: 0, count: 31)

student[0] = 1
for _ in 0..<28 {
    let n = Int(readLine()!)!
    student[n] = 1
}

for i in 1...30 {
    if student[i] == 0 {
        print(i)
    }
}
