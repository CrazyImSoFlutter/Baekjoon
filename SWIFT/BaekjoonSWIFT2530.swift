let ABC = readLine()!.split(separator: " ").map { Int(String($0))! }
var A = ABC[0], B = ABC[1], C = ABC[2]
let D = Int(readLine()!)!

B += D / 60
C += D % 60

B += C / 60
C %= 60
A += B / 60
B %= 60

A %= 24

print(A, B, C)
