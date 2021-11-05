import Foundation

let AB = readLine()!.split(separator: " ").map { Int(String($0))! }
var A = AB[0], B = AB[1]
var bin = [Int]()
var sum = 0

while !(A == B && A % 2 == 1) {
    if (B - A + 1) % 2 == 0 {
        bin.append((B - A + 1) / 2)
    } else {
        if B % 2 == 1 {
            bin.append((B - A) / 2 + 1)
        } else {
            bin.append((B - A) / 2)
        }
    }
    if A % 2 == 1 {
        A += 1
    }
    if B % 2 == 1 {
        B -= 1
    }
    A /= 2
    B /= 2
}

bin.append(1)

for i in 0..<bin.count {
    sum += Int(pow(2, Double(i))) * bin[i]
}

print(sum)
