func facto(N : Int) -> Int {
    if N == 1 || N == 0 {
        return 1
    } else {
        return facto(N: N - 1) * N
    }
}

print(facto(N: Int(readLine()!)!))
