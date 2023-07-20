let n = Int(readLine()!)!
var logs = [String: String]()

for _ in 0..<n {
    let log = readLine()!.split(separator: " ").map { String($0) }
    let name = log[0]
    let entrance = log[1]
    
    if entrance == "leave" {
        logs[name] = nil
    } else {
        logs[name] = entrance
    }
}

let sortedLogs = logs.sorted(by: >)

for i in sortedLogs {
    print(i.key)
}
