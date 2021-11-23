let N = Int(readLine()!)!
var B = Array(repeating: true, count: N + 1)
var P = [Int]()

getPrime()
print(getAnswer())


func getPrime() {
    var i = 2

    while (i * i) < N + 1 {
        var j = i * 2

        while j < N + 1 {
            B[j] = false
            j += i
        }
        i += 1
    }
    B[1] = false
    for i in 1...N {
        if B[i] {
            P.append(i)
        }
    }
}

func getAnswer() -> Int {
    var left = 0
    var right = 0
    var sum = 0
    var answer = 0

    while true {
        if sum >= N {
            sum -= P[left]
            left += 1
        } else if right == P.count {
            break
        } else {
            sum += P[right]
            right += 1
        }
        if sum == N {
            answer += 1
        }
    }
    return answer
}
