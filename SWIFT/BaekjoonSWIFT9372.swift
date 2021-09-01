let T = Int(readLine()!)!

for _ in 0..<T {
    let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
    for _ in 0..<NM[1] {
        _ = readLine()!
    }
    print(NM[0] - 1) 
}


