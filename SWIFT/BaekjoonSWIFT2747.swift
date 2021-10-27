let N = Int(readLine()!)!
var D = Array(repeating: 0, count: 46)

func fibo(_ n: Int) -> Int {
    if n == 0 {
        return 0
    } else if n == 1 {
        return 1
    }
    if D[n] != 0 {
        return D[n]
    } else {
        D[n] = fibo(n - 1) + fibo(n - 2)
        return D[n]
    }
}

print(fibo(N))
