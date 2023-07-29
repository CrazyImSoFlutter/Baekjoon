let a1a0 = readLine()!.split(separator: " ").map { Int(String($0))! }
let a1 = a1a0[0], a0 = a1a0[1]
let c = Int(readLine()!)!
let n = Int(readLine()!)!

if a1 * n + a0 <= c * n && a1 <= c {
    print(1)
} else {
    print(0)
}
