var arr = [Int]()
var max : Int

for _ in 0..<9 {
    let a = Int(readLine()!)!
    arr.append(a)
}

max = arr.max()!

for i in 0..<9 {
    if arr[i] == max {
        print(max)
        print(i + 1)
    }
}
