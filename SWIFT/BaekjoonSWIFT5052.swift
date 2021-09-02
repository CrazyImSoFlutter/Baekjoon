import Foundation

let t = Int(readLine()!)!

for _ in 0..<t {
    let n = Int(readLine()!)!
    var strArr = [String]()
    var flag = true
    for _ in 0..<n {
        strArr.append(readLine()!)
    }
    strArr.sort(by: <)
    for i in 0..<n - 1 {
        if strArr[i].count < strArr[i + 1].count {
            if strArr[i + 1].hasPrefix( strArr[i]) {
                flag = false
                break
            }
        }
    }
    if flag {
        print("YES")
    } else {
        print("NO")
    }
}
