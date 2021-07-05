var code = readLine()!
var sum = 0
var arr = [String]()

for i in code {
    arr.append(String(i))
}
for i in arr {
    if i == "A" || i == "B" || i == "C" {
        sum += 3
    } else if i == "D" || i == "E" || i == "F" {
        sum += 4
    } else if i == "G" || i == "H" || i == "I" {
        sum += 5
    } else if i == "J" || i == "K" || i == "L" {
        sum += 6
    } else if i == "M" || i == "N" || i == "O" {
        sum += 7
    } else if i == "P" || i == "Q" || i == "R" || i == "S" {
        sum += 8
    } else if i == "T" || i == "U" || i == "V" {
        sum += 9
    } else if i == "W" || i == "X" || i == "Y" || i == "Z" {
        sum += 10
    }
}

print(sum)
