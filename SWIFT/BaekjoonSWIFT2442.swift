let n = Int(readLine()!)!

Array(1...n).forEach({
    print(String(repeating: " ", count: n-$0), terminator:"")
    print(String(repeating: "*", count: $0*2-1))
})
