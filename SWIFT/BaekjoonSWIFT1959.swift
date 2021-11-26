let MN = readLine()!.split(separator: " ").map { Int(String($0))! }
let M = MN[0], N = MN[1]
var count = 0
var y = 0
var x = 0

if M > N {
    count = N * 2 - 1
    y = N % 2 == 0 ? N / 2 + 1 : M - (N / 2)
    x = N % 2 == 0 ? N / 2 : N / 2 + 1
} else if M < N {
    count = (M - 1) * 2
    y = M / 2 + 1
    x = M % 2 == 0 ? M / 2 : N - M / 2
} else {
    count = (M - 1) * 2
    y = M / 2 + 1
    x = M % 2 == 0 ? M / 2 : M / 2 + 1
}

print(count)
print(y, x)
