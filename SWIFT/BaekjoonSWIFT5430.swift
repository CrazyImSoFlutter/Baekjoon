import Foundation

let T = Int(readLine()!)!

for _ in 0..<T {
    var p = readLine()!
    let n = Int(readLine()!)!
    var arrStr = readLine()!
    var l = 0
    var r = 0
    var flag = true
    arrStr.remove(at: arrStr.index(before: arrStr.endIndex))
    arrStr.remove(at: arrStr.startIndex)
    var arr = arrStr.split(separator: ",").map { Int($0)! }
    p = p.replacingOccurrences(of: "RR", with: "")
    
    for i in p {
        if i == "R" {
            flag = !flag
        } else if i == "D" {
            if flag {
                l += 1
            } else {
                r += 1
            }
        }
    }
    if l + r <= n {
        if flag {
            print("[", terminator: "")
            for i in l..<(n - r) {
                print(arr[i], terminator: "")
                if i != (n - r - 1) {
                    print(",", terminator: "")
                }
            }
            print("]")
        } else {
            print("[", terminator: "")
            for i in stride(from: (n - r - 1), through: l, by: -1) {
                print(arr[i], terminator: "")
                if i != l {
                    print(",", terminator: "")
                }
            }
            print("]")
        }
    } else {
        print("error")
    }
}
