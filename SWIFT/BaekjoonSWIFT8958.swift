let N = Int(readLine()!)!

for _ in 0..<N {
    let OX = readLine()!
    var arr = [Character]()
    var count = 0
    var answer = 0
    for i in OX {
        arr.append(i)
    }
    for i in 0..<arr.count {
        if arr[i] == "O" {
            count += 1
            answer += count
        } else if arr[i] == "X" {
            count = 0
            answer += count
        }
    }
    print(answer)
}
