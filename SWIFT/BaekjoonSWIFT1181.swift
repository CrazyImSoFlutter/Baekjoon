let N = Int(readLine()!)!
var arr = [(Int, String)]()
var tmp = ""
for _ in 0..<N {
    let str = readLine()!
    arr.append((str.count, str))
}
arr.sort(by: <)
for (x, y) in arr {
    if tmp == y { continue }
    tmp = y
    print(y) 
}
