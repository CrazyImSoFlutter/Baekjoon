let N = readLine()!.map { Int(String($0))! }
var answer = 0
var sum = 0

if N.count != 1 {
    sum = N.reduce(0, +)
    answer += 1
} else {
    sum = N[0]
}

while sum / 10 > 0 {
    var A = [Int]()

    while sum > 0 {
        A.append(sum % 10)
        sum /= 10
    }
    sum = A.reduce(0, +)
    answer += 1
}

if sum != 0 && sum % 3 == 0 {
    print(answer)
    print("YES")
} else {
    print(answer)
    print("NO")
}
