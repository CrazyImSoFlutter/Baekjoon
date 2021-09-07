for _ in 0..<Int(readLine()!)! {
    let k = Int(readLine()!)!
    let n = Int(readLine()!)!
    var apt = Array(repeating: Array(repeating: 0, count: n + 1), count: k + 1)
    
    for i in 1...n {
        apt[0][i] = i
    }

    for i in 1...k {
        for j in 1...n {
            var sum = 0
            for k in 1...j {
                sum += apt[i - 1][k]
            }
            apt[i][j] = sum
        }
    }
    print(apt[k][n])
}
