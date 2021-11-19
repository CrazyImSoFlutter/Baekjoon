import Foundation

let N = Int(readLine()!)!
let M = Int(readLine()!)!
var A = Array(repeating: false, count: 10)
var B = [Int]()
var R = abs(N - 100)

if M != 0 {
    B = readLine()!.split(separator: " ").map { Int(String($0))! }
}

for i in B { A[i] = true }

func check(_ n: Int) -> Int {
    var t = n
    var len = 0

    if t == 0 {
        if A[t] == true {
            return 0
        } else {
            return 1
        }
    }
    
    while t > 0 {
        if A[t % 10] { return 0 }
        t /= 10
        len += 1
    }

    return len
}

for i in 0...1000000 {
    let c = i
    let len = check(c)

    if len > 0 {
        let push = abs(c - N)
        if R > push + len {
            R = push + len
        }
    }
}

print(R)
