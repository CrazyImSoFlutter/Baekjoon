while true {
    let pal = readLine()!.map{ Int(String($0))! }
    var isPal = true

    if pal == [0] {
        break
    }
    
    for i in 0..<pal.count / 2 {
        if pal[i] == pal[pal.count - 1 - i] {
            continue
        } else {
            isPal = false
            break
        }
    }
    print(isPal ? "yes" : "no")
}
