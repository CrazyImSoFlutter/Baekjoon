var N = Int(readLine()!)!
var str = String(readLine()!)
var arr = [Int]()

for i in str {
    arr.append(Int(String(i))!)
}

print(arr.reduce(0, +))

