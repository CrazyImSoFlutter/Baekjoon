let str = readLine()!.map{ String($0) }
var answer = ""
var stack = [String]()

for i in str {
    if i >= "A", i <= "Z" {
        answer += i
    } else {
        switch i {
            case "(":
                stack.append(i)
            case "*", "/":
                while !stack.isEmpty {
                    if stack.last! == "*" || stack.last! == "/" {
                        answer += stack.popLast()!
                    } else {
                        break
                    }
                }
                stack.append(i)
            case "+", "-":
                while !stack.isEmpty {
                    if stack.last! != "(" {
                        answer += stack.popLast()!
                    } else {
                        break
                    }
                }
                stack.append(i)
            case ")":
                while !stack.isEmpty {
                    if stack.last! != "(" {
                        answer += stack.popLast()!
                    } else {
                        break
                    }
                }
                stack.popLast()!
            default:
                stack.append(i)
        }
    }
}

while !stack.isEmpty {
    answer += stack.popLast()!
}

print(answer)
