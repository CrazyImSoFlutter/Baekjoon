let N = Int(readLine()!)!
var arr = [(Int, String)]()

for _ in 0..<N {
    let str = readLine()!.split(separator: " ")
    arr.append((Int(String(str[0]))!, String(str[1])))
}

arr.sort(by: { $0.0 < $1.0 })
for (x, y) in arr {
    print(x, y)
}
