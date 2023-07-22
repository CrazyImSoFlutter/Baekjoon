let T = Int(readLine()!)!
var eratos = Array(repeating: true, count: 1000001)

for i in 2...1000 {
    for j in stride(from: i * 2, to: 1000001, by: i) {
        eratos[j] = false
    }
}

for _ in 0..<T {
    var count = 0
    let N = Int(readLine()!)!
    
    if N == 4 {
        print(1)
        continue
    }
    
    for i in stride(from: 3, to: N / 2 + 1, by: 2) where eratos[i] && eratos[N - i] {
        count += 1
    }
    
    print (count)
}
