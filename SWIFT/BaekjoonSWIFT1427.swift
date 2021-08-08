let N = readLine()!
var arr = [Int]()

for i in N {
    arr.append(Int(String(i))!)
}

arr = arr.sorted()
arr.reverse()

print(arr.map { String($0) }.joined(separator: ""))
