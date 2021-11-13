let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nm[0], m = nm[1]
var fiv = 0
var two = 0

fiv = getZero_fiv(n) - getZero_fiv(m) - getZero_fiv(n - m)
two = getZero_two(n) - getZero_two(m) - getZero_two(n - m)

print(min(fiv, two))

func getZero_fiv(_ a: Int) -> Int {
    var ret = 0
    var num = 1

    if a == 0 {
        return ret
    }
    while num < a {
        num *= 5
        ret += a / num
    }
    return ret
}

func getZero_two(_ a: Int) -> Int {
    var ret = 0
    var num = 1

    if a == 0 {
        return ret
    }
    while num < a {
        num *= 2
        ret += a / num
    }
    return ret

}
