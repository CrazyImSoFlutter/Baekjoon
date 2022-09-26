var NK = readLine()!.split(separator: " ").map { Int(String($0))! }
var numbers = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = NK[0]
let K = NK[1]
var answer = 0

func mergeSort(_ A: inout [Int], _ p: Int, _ r: Int) {
    if p < r {
        var q = (p + r) / 2
        mergeSort(&A, p, q)
        mergeSort(&A, q + 1, r)
        merge(&A, p, q, r)
    }
}

func merge(_ A: inout [Int], _ p: Int, _ q: Int, _ r: Int) {
    var i = p
    var j = q + 1
    var t = 1
    var tmp = Array(repeating: 0, count: N + 1)

    while i <= q && j <= r {
        if A[i] <= A[j] {
            tmp[t] = A[i]
            t += 1
            i += 1
        } else {
            tmp[t] = A[j]
            t += 1
            j += 1
        }
        answer += 1
        if answer == K {
            print(tmp[t - 1])
        }
    }
    while i <= q {
        tmp[t] = A[i]
        t += 1
        i += 1
        answer += 1
        if answer == K {
            print(tmp[t - 1])
        }
    }
    while j <= r {
        tmp[t] = A[j]
        t += 1
        j += 1
        answer += 1
        if answer == K {
            print(tmp[t - 1])
        }
    }
    i = p
    t = 1
    while i <= r {
        A[i] = tmp[t]
        i += 1
        t += 1
    }
}

mergeSort(&numbers, 0, N - 1)
if answer < K {
    print(-1)
}
