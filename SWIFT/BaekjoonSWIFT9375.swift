for _ in 0..<Int(readLine()!)! {
    let N = Int(readLine()!)!
    var D = [String : Int]()
    var sum = 1

    for _ in 0..<N {
        let tmp = readLine()!.split(separator: " ").map { String($0) }
        
        if D[tmp[1]] == nil {
            D.updateValue(1, forKey: tmp[1])
        } else {
            D.updateValue(D[tmp[1]]! + 1, forKey: tmp[1])
        }
    }

    for (_, value) in D {
        sum *= (value + 1)
    }
    print(sum - 1)
}
