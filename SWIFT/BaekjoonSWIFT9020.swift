let T = Int(readLine()!)!
var prime = Array(repeating: true, count: 10001)

func primeNum() {
    prime[0] = false
    prime[1] = false
    for i in 2..<10000 {
        for j in stride(from: i * 2, to: 10000, by: i) {
            prime[j] = false
        }
    }
}

func goldbach(_ a: Int, _ b: Int, _ c: Int) {
    if a < 4 || a > 10000 || a % 2 != 0 {
        return
    } else {
        if prime[b] == true && prime[c] == true {
            print(b, c)
        } else {
            goldbach(a, b - 1, c + 1)
        }
    }
}

primeNum()

for _ in 0..<T {
    let tmp = Int(readLine()!)!
    goldbach(tmp, tmp / 2, tmp / 2)
}
