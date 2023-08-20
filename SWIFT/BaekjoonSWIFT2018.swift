func solve() {
    let N = Int(readLine()!)!

    var l = 1, r = 1
    var sum = 0
    var answer = 1

    while l <= r && r <= N {
        if sum < N {
            sum += r
            r += 1
        } else {
            if sum == N {
                answer += 1
            }
            sum -= l
            l += 1
        }
    }
    print(answer)
}

solve()
