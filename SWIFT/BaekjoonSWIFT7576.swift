let N = Int(readLine()!)!
let M = Int(readLine()!)!

var tomato : [[Int]] = Array(repeating: Array(repeating: 0, count: N), count: M)

for i in 0..<M {
    tomato[i] = Int(readLine()!)!.split.map{Int($0)}
}
