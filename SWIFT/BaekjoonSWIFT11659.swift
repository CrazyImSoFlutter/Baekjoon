let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
var number = readLine()!.split(separator: " ").map { Int(String($0))! }

for i in 0 ..< NM[0] {
    if i == 0 {
        continue
    }
    number[i] += number[i - 1]
}

number.insert(0, at: 0)

for i in 0 ..< NM[1] {
    var ij = readLine()!.split(separator: " ").map { Int(String($0))! }
    print(number[ij[1]] - number[ij[0] - 1])
}
