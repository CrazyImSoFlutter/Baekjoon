let N = Int(readLine()!)!
var S = readLine()!.split(separator: " ").map { Int(String($0))! }
var number = Array(repeating: false, count: 2000001)
var index = 0

func dfs(_ begin: Int, _ sum: Int) {
    if begin == N {
        number[sum] = true
        return
    }
    dfs(begin + 1, sum + S[begin])
    dfs(begin + 1, sum)
}

dfs(0, 0)

while true {
    if !number[index] {
        print(index)
        break
    }
    index += 1
}
