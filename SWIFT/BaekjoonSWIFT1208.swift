let NS = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = NS[0]
let S = NS[1]
let Arr = readLine()!.split(separator: " ").map { Int(String($0))! }
var first = Array(repeating: 0, count: 1 << (N - (N / 2)))
var second = Array(repeating: 0, count: 1 << (N / 2))

for i in 0..<(1 << (N - (N / 2))) {
    for j in 0..<(N - (N / 2)) {
        if (i & (1 << j)) != 0 {
            first[i] += Arr[j];
        }
    }
}

for i in 0..<(1 << (N / 2)) {
    for j in 0..<N / 2 {
        if (i & (1 << j)) != 0 {
            second[i] += Arr[j + (N - (N / 2))]
        }
    }
}

first.sort()
second.sort(by: >)

var left = 0
var right = 0
var result : UInt64 = 0

while left < 1 << (N - (N / 2)) && right < 1 << (N / 2) {
    if first[left] + second[right] == S {
        var cnt1 : UInt64 = 1
        var cnt2 : UInt64 = 1
        left += 1
        right += 1
        while left < 1 << (N - (N / 2)) && first[left] == first[left - 1] {
            left += 1
            cnt1 += 1
        }
        while right < 1 << (N / 2) && second[right] == second[right - 1] {
            right += 1
            cnt2 += 1
        }
        result += (cnt1 * cnt2)
    } else if first[left] + second[right] < S {
        left += 1
    } else if first[left] + second[right] > S {
        right += 1
    }
}

if S == 0 {
    result -= 1
}

print(result)
