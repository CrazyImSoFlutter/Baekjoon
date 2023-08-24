let S = Int(readLine()!)!
var N = 0
var sum = 0

while sum < S {
    N += 1
    sum += N
}

if sum != S {
    print(N - 1)
} else {
    print(N)
}
