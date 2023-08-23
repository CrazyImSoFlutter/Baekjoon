let id = readLine()!

for i in 0..<3 {
    for j in 0..<3 {
        if i == 1 && j == 1 {
            print(":\(id):", terminator: "")
        } else {
            print(":fan:", terminator: "")
        }
        if j == 2 {
            print("")
        }
    }
}
