let NK = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = NK[0]
var K = NK[1]
var coin = [Int]()
var answer = 0
var tmp = 0

for _ in 0..<N { coin.append(Int(readLine()!)!) }
for i in stride(from: N - 1, through: 0, by: -1) {
    if K == 0 {
        break
    }
    if coin[i] <= K {
        tmp = coin[i]
    } else {
        continue
    }
    if K % tmp == 0 {
        answer += K / tmp
        K = 0
        break
    } else {
        let tmp2 = K % tmp
        answer += (K - tmp2) / tmp
        K = tmp2
    }
}
print(answer)
