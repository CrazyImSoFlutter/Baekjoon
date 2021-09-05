for _ in 0..<Int(readLine()!)! {
    let Case = readLine()!.split(separator: " ").map { Int(String($0))! }
    var floor = Case[2] % Case[0]
    var room = Case[2] / Case[0] + 1

    if floor == 0 {
        floor = Case[0]
        room -= 1
    }

    if room >= 10 {
        print("\(floor)\(room)")
    } else {
        print("\(floor)0\(room)")
    }
}
