var X = Int(readLine()!)!
var N = Int(readLine()!)!
var answer = 0

for _ in 0..<N {
    let AB = readLine()!.split(separator: " ").map { Int(String($0))! }
    answer += AB[0] * AB[1]
}

if answer == X {
    print("Yes")
} else {
    print("No")
}
