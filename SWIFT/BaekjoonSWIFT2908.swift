let arr = readLine()!.split(separator: " ")
var Aarr = [Int]()
var Barr = [Int]()

for i in arr[0] {
    Aarr.append(Int(String(i))!)
}
for i in arr[1] {
    Barr.append(Int(String(i))!)
}

var A = 100 * Aarr[2] + 10 * Aarr[1] + Aarr[0]
var B = 100 * Barr[2] + 10 * Barr[1] + Barr[0]

print(max(A, B))
