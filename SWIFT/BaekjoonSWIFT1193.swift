var X = Int(readLine()!)!
var i = 1

while X > i {
    X -= i
    i += 1
}

if i % 2 == 1 {
    print("\(i - X + 1)/\(X)")
} else {
    print("\(X)/\(i - X + 1)")
}

