let T = Int(readLine()!)!

for _ in 0..<T {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let _ = input[0]
    let M = input[1]
    var arr = readLine()!.split(separator: " ").enumerated().map{ ($0, Int(String($1))!)}
    var answer = 1

    while !arr.isEmpty {
        let first = arr.first!
        var flag = false
        for i in 1..<arr.count {
            if arr[i].1 > first.1 {
                arr.append(arr.removeFirst())
                flag = true
                break
            }
        }
        if !flag {
            if M == arr.removeFirst().0 {
                print(answer)
                break
            }
            answer += 1
        }
    }
}

