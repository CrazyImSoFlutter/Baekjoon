import Foundation

func cantor(n : Int) -> String {
    if n <= 1 {
        return "-"
    }
    let cantorLine = cantor(n: n / 3)
    return cantorLine + String(repeating: " ", count: n / 3) + cantorLine
}

while true {
    let N = readLine()
    
    if N == nil {
        break
    } else {
        print(cantor(n: Int(pow(3.0, Double(N!)!))))
    }
}
