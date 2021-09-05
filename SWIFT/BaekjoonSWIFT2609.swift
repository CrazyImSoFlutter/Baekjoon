let AB = readLine()!.split(separator: " ").map { Int(String($0))! }
let A = AB[0], B = AB[1]

func GCD(_ a: Int, _ b: Int) -> Int {
    let r = a % b

    if r == 0 {
        return b
    } else {
        return GCD(b, r)
    }
}

let ansGCD = GCD(A, B)
print(ansGCD)
print(A * B / ansGCD)
