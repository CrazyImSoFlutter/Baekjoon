let N = Int(readLine()!)!
var A = [Int]()
var I = 0
var answer = [Int]()
var answerPrint = ""

func GCD(_ a: Int, _ b: Int) -> Int {
    return (a % b > 0) ? GCD(b, a % b) : b
}

for _ in 0..<N {
    A.append(Int(readLine()!)!)
}
A.sort(by: <)
I = A[1] - A[0]
for i in 1..<N - 1 {
    I = GCD(I, A[i + 1] - A[i])
}

var tmp = 1
while tmp * tmp <= I {
    if I % tmp == 0 {
        answer.append(tmp)
        if tmp != I / tmp {
            answer.append(I / tmp)
        }
    }
    tmp += 1
}
answer.sort(by: <)
for i in answer {
    if i == 1 {
        continue
    }
    answerPrint += String(i)
    answerPrint += " "
}
print(answerPrint)

