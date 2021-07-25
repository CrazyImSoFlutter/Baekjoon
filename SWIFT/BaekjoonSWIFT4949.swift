while true {
    let str = readLine()!
    var bracket = [Character]()
    var flag = true
    
    if str == "." {
        break
    }

    for i in str {
        if i == "(" || i == "[" {
            bracket.append(i)
        } else if i == ")" {
            if bracket.count == 0 {
                print("no")
                flag = false
                break
            }
            if bracket[bracket.count - 1] == "(" {
                bracket.remove(at: bracket.count - 1)
            } else {
                print("no")
                flag = false
                break
            }
        } else if i == "]" {
            if bracket.count == 0 {
                print("no")
                flag = false
                break
            }
            if bracket[bracket.count - 1] == "[" {
                bracket.remove(at: bracket.count - 1)
            } else {
                print("no")
                flag = false
                break
            }
        }
    }
    
    if bracket.count == 0 && flag == true {
        print("yes")
    } else if bracket.count != 0 && flag == true {
        print("no")
    }
}
