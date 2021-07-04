var T = Int(readLine()!)!

for i in 0..<T {
    var temp = readLine()!.split(separator: " ")
    var N = Int(temp[0])!
    var str = [String]()
    for j in temp[1] {
        for k in 0..<N {
            print(j, terminator: "")
        }
    }
    if i != T - 1 {
        print("")
    }
}
