import Foundation

let T = Int(readLine()!)!

for _ in 0..<T {
    var n = Int(readLine()!)!

    if n == 0 || n == 1 {
        print(2)
        continue
    }
    var divider = 2
    var root = Int(sqrt(Double(n)))
    while divider <= root {
        if n % divider == 0 {
            n += 1
            divider = 2
            root = Int(sqrt(Double(n)))
        } else {
            divider += 1
        }
    }
    print(n)
}
