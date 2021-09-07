let N = Int(readLine()!)!

var sugar = 0
var left = 0

sugar += N / 5
left = N % 5

while true {
    if left % 3 != 0 {
        sugar -= 1
        left += 5
    } else {
        sugar += left / 3
        break
    }
    if sugar < 0 {
        sugar = -1
        break
    }
}

print(sugar)
