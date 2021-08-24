var prime = Array(repeating: true, count: 246913)

func primeNum() {
    prime[0] = false
    prime[1] = false
    for i in 2..<246913 {
        for j in stride(from: i * 2, to: 246913, by: i) {
            prime[j] = false
        }
    }
}

func howManyPrime(_ a: Int) -> Int {
    var num = 0

    for i in 1...a {
        if prime[i] == true {
            num += 1
        }
    }
    return num
}

primeNum()

while true {
    let M = Int(readLine()!)!
    let N = M * 2
    
    if M == 0 {
        break
    }
    
    print(howManyPrime(N) - howManyPrime(M))
    
}
