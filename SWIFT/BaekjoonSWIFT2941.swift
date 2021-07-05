import Foundation

var n = readLine()!
let m = ["c=", "c-", "dz=", "d-", "lj", "nj", "s=", "z="]
for i in 0..<m.count {
    n = n.replacingOccurrences(of: m[i], with: "a")
}
print(n.count)
