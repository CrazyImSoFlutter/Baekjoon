let NM = readLine()!.split(separator: " " ).map { Int(String($0))! }
let N = NM[0]; let M = NM[1]
var arr = Array(repeating: 0, count: M)

func dfs(_ depth: Int) {
    if depth == M {
        print(arr.map { String($0) }.joined(separator: " "))
        return
    }
    for i in 0..<N {
        if depth != 0 {
            if arr[depth - 1] <= i + 1 {
                arr[depth] = i + 1
                dfs(depth + 1)
            }
        } else {
            arr[depth] = i + 1
            dfs(depth + 1)
        }
    }
}

dfs(0)
