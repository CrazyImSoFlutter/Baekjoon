let T = Int(readLine()!)!

var C: Int = 0

for _ in 0..<T {
    C = Int(readLine()!)!
    
    makeChange(money: 25)
    makeChange(money: 10)
    makeChange(money: 5)
    makeChange(money: 1)
    print()
}

func makeChange(money: Int) {
    print(C / money, terminator: " ")
    C %= money
}
