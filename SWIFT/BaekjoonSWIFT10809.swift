var S = String(readLine()!)
var arr = [Character]()

for i in S {
    arr.append(i)
}

for i in 0..<26 {
    var checker = false
    for j in 0..<arr.count {
        if arr[j].asciiValue! == i + 97 {
            print(j, terminator: " ")
            checker = true
            break
        } else {
            checker = false
        }
    }
    if checker == false {
        print(-1, terminator: " ")
    }
}

