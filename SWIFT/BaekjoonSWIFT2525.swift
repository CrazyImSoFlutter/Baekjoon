let AB = readLine()!.split(separator: " ").map { Int(String($0))! }
var A = AB[0], B = AB[1]
let C = Int(readLine()!)!

B += C
A += B / 60
B %= 60

A %= 24

print(A, B)
