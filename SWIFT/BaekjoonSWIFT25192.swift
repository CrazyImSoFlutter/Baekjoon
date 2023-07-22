let N = Int(readLine()!)!
var chat = [String]()
var count = 0

for _ in 0..<N {
    let nickname = readLine()!
    
    if nickname != "ENTER" {
        chat.append(nickname)
    } else {
        count += Set(chat).count
        chat.removeAll()
    }
}
count += Set(chat).count

print(count)
