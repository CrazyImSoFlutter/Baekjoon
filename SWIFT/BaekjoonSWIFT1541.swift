let expression = Array(readLine()!)
var number = [Int]()
var sign = [String]()
var num = ""

for i in 0..<expression.count {
    if expression[i] == "-" || expression[i] == "+" {
        if (num != "") {
            number.append(Int(num)!)
            num = ""
        }
        sign.append(String(expression[i]))
    } else {
        num += String(expression[i])
    }
    if i == expression.count - 1 {
        number.append(Int(num)!)
    }
}

var index = 0
while index < sign.count {
    if sign[index] == "-" {
        index += 1
        continue
    } else {
        number[index] += number[index + 1]
        number.remove(at: index + 1)
        sign.remove(at: index)
    }
}

while sign.count > 0 {
    number[0] -= number[0 + 1]
    number.remove(at: 0 + 1)
    sign.remove(at: 0)
}

print(number[0])
