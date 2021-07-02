var N = Int(readLine()!)!

for _ in 0..<N {
    var arr = readLine()!.split(separator: " ").map { Int(String($0))! }
    var avg = Double(arr.reduce(0, +) - arr[0]) / Double(arr.count - 1)
    var count = 0
    for i in 1..<arr[0] {
        if Double(arr[i]) >= avg {
            count += 1
        }
    }
    print(avg)
    print(Double(count) / Double(arr.count - 1))
}
