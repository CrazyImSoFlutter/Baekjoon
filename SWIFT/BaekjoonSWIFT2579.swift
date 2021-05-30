let N = Int(readLine()!)!
var arr = [Int]()
var cache : [[Int]] = Array(repeating: Array(repeating: 1, count: 3), count: 301)

for _ in 1...N {
    let a = Int(readLine()!)!
    arr.append(a)
}
cache[0][1] = 0
cache[0][0] = 0
cache[1][1] = arr[0]
cache[1][0] = 0
if N > 1 {
    cache[2][1] = arr[1]
    cache[2][0] = arr[0] + arr[1]
    if N > 2 {
        for i in 3...N {
            cache[i][1] = cache[i - 1][0] + arr[i - 1]
            cache[i][0] = max(cache[i - 2][0], cache[i - 2][1]) + arr[i - 1]
        }
    }
}

print(max(cache[N][0], cache[N][1]))
