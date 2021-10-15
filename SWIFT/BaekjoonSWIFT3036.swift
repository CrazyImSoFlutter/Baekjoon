let N = Int(readLine()!)!
var O = readLine()!.split(separator: " ").map { Int(String($0))! }
var answer = ""

func GCD(_ a: Int, _ b: Int) -> Int {
    return (a % b > 0) ? GCD(b, a % b) : b
}

for i in 1..<N {
    let gcd = GCD(O[0], O[i])

    answer += "\(O[0] / gcd)/\(O[i] / gcd)\n"
}

print(answer)
