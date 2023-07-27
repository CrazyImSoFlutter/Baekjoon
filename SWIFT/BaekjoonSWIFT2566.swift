var max = 0
var row = 0
var column = 0

for i in 0..<9 {
    let num = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    for j in 0..<9 {
        if max < num[j] {
            max = num[j]
            row = i
            column = j
        }
    }
}

print(max)
print(row + 1, column + 1, separator: " ")
