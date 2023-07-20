let abcdef = readLine()!.split(separator: " ").map { Int(String($0))! }
let a = abcdef[0]
let b = abcdef[1]
let c = abcdef[2]
let d = abcdef[3]
let e = abcdef[4]
let f = abcdef[5]

for x in -999...999 {
    for y in -999...999 {
        if c == (a * x + b * y) && f == (d * x + e * y) {
            print(x, y)
        }
    }
}
