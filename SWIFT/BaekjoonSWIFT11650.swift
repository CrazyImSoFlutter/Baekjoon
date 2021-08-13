let N = Int(readLine()!)!
var arr = [(Int, Int)]()

for _ in 0..<N {
    let xy = readLine()!.split(separator: " ").map { Int(String($0))! }
    arr.append((xy[0], xy[1]))
}
arr.sort(by: <)
for (x, y) in arr { print(x, y) }
