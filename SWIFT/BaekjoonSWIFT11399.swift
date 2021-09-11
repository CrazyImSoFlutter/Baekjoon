let N = Int(readLine()!)!
var time = readLine()!.split(separator: " ").map { Int(String($0))! }
var answer = 0

time.sort()

for i in 0..<N {
    answer += time[i] * (N - i)
}

print(answer)
