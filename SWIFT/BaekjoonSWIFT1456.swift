import Foundation

let AB = readLine()!.split(separator: " ").map { Int(String($0))! }
let A = AB[0]
let B = AB[1]
let size = 10000001
var arr = Array(repeating: true, count: size)
var ans = 0

for i in stride(from: 2, to: size, by: 1) {
    if arr[i] {
        for j in stride(from: i * i, to: size, by: i) {
            arr[j] = false
        }
    }
}

for i in stride(from: 2, to: size, by: 1) {
    if i * i > B { break }
    if arr[i] == true {
        var tmp : UInt = UInt(i * i)
        while tmp <= UInt(B) {
            if UInt(A) <= tmp {
                ans += 1
            }
            tmp &*= UInt(i)
            if tmp % UInt(i) != 0 { break }
        }
    }
}
print(ans)
