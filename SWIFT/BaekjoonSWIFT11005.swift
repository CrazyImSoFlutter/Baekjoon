let NB = readLine()!.split(separator: " ").map { Int(String($0))! }
var N = NB[0]
let B = NB[1]
var tenToB : String = ""

while N >= B {
    if N % B > 9 {
        tenToB += String(UnicodeScalar(N % B + 55)!)
    } else {
        tenToB += String(N % B)
    }
    N /= B
}

if N > 9 {
    tenToB += String(UnicodeScalar(N % B + 55)!)
} else {
    tenToB += String(N)
}

print(String(tenToB.reversed()))
