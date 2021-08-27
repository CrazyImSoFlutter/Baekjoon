let T = readLine()!.map { String($0) }
let P = readLine()!.map { String($0) }
var pi = Array(repeating: 0, count: P.count)
var answer = [Int]()

func getPi() {
    var j = 0
    for i in 1..<P.count {
        while j > 0 && P[i] != P[j] {
            j = pi[j - 1]
        }
        if P[i] == P[j] {
            j += 1
            pi[i] = j
        }
    }
}

func kmp() {
    getPi()
    var j = 0
    for i in 0..<T.count {
        while j > 0 && T[i] != P[j] {
            j = pi[j - 1]
        }
        if T[i] == P[j] {
            if j == P.count - 1 {
                answer.append(i - P.count + 2)
                j = pi[j]
            } else {
                j += 1
            }
        }
    }
}

kmp()
print(answer.count)
print(answer.map { String($0) }.joined(separator: " "))
