let N = Int(readLine()!)!
var arr = [(Int, Int)]()

for _ in 0..<N {
    let xy = readLine()!.split(separator: " ").map { Int(String($0))! }
    arr.append((xy[1], xy[0]))
}
arr.sort(by: <)
for (x, y) in arr { print(y, x) }

