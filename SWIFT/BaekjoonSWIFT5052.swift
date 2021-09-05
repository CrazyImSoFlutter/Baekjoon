for _ in 0..<Int(readLine()!)! {
    let n = Int(readLine()!)!
    var strArr = Array(repeating: "", count: n)
    var flag = true
    for i in 0..<n {
        strArr[i] = readLine()!
    }
    strArr.sort()
    for i in stride(from: 0, to: n - 1, by: 1) {
        if strArr[i + 1].hasPrefix( strArr[i]) {
            flag = false
            break
        }
    }
    print(flag ? "YES" : "NO")
}
