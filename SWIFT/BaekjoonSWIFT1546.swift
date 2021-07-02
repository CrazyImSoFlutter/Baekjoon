let N = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map { Double(String($0))! }
let max = arr.max()!

for i in 0..<N {
    arr[i] = arr[i] / max * 100
}
print(arr.reduce(0, +) / Double(N))
