while true {
    let AB = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    if AB[0] == 0 && AB[1] == 0 {
        break
    }
    if AB[0] > AB[1] {
        print("Yes")
    } else {
        print("No")
    }
}
