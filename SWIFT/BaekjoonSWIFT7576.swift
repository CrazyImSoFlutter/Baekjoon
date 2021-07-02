let O = readLine()!.split(separator: " ").map{Int($0)!}
let N = O[0]
let M = O[1]

var tomato : [[Int]] = Array(repeating: Array(repeating: 0, count: N), count: M)

for i in 0..<M {
    tomato[i] = readLine()!.split(separator: " ").map{Int($0)!}
}
