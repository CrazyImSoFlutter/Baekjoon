let T = readLine()!.map { String($0) }
var S = [(String, Int)]()
var A = 0

for i in 0..<T.count {
    if T[i] == "(" {
        S.append((T[i], 0))
    } else if T[i] == ")" {
        S.popLast()
        if (T[i - 1] == "(") {
            A += S.count
        } else {
            A += 1
        }
    }
}

print(A)
