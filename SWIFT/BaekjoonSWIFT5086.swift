while true {
    let AB = readLine()!.split(separator: " ").map { Int(String($0))! }
    let A = AB[0], B = AB[1]
    if A == 0 && B == 0 {
        break
    }
    if A % B == 0 {
        print("multiple")
    } else if B % A == 0 {
        print("factor")
    } else {
        print("neither")
    }
}
