let abc = readLine()!.split(separator: " ").map { Int(String($0))! }
let sortedABC = abc.sorted(by: <)
let a = sortedABC[0]
let b = sortedABC[1]
let c = sortedABC[2]

if c >= a + b {
    print((a + b) * 2 - 1)
} else {
    print (a + b + c)
}
