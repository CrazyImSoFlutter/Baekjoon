func GCD(_ a: Int, _ b: Int) -> Int {
    if a % b == 0 {
        return b
    } else {
        return GCD(b, a % b)
    }
}

for _ in 0..<Int(readLine()!)! {
    let AB = readLine()!.split(separator: " ").map { Int(String($0))! }
    let A = AB[0], B = AB[1]
    
    print(A * B / GCD(B, A))
}
