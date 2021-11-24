let NC = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = NC[0], C = NC[1]
var O = readLine()!.split(separator: " ").map { Int(String($0))! }
var A1 = [Int]()
var A2 = [Int]()
var ans = 0

dfs(0, N / 2 - 1, &A1, 0)
dfs(N / 2, N - 1, &A2, 0)
A2.sort(by: <)

for i in 0..<A1.count {
    ans += upperBound(0, A2.count, C - A1[i], A2) - 1
}

print(ans)


func dfs(_ s: Int, _ e: Int, _ array: inout [Int], _ sum: Int) {
    if s > e {
        array.append(sum)
    } else {
        dfs(s + 1, e, &array, sum)
        dfs(s + 1, e, &array, sum + O[s])
    }
}

func upperBound(_ s: Int, _ e: Int, _ k: Int, _ array: [Int]) -> Int {
    var m = 0
    var start = s
    var end = e

    while end - start > 0 {
        m = (start + end) / 2
        if array[m] <= k {
            start = m + 1
        } else {
            end = m
        }
    }
    return end + 1
}
