let N = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }
let v = Int(readLine()!)!
var count = 0

for i in 0..<N {
    if numbers[i] == v {
        count += 1
    }
}

print(count)
