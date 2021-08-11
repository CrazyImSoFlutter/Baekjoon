let NM = readLine()!.split(separator: " " ).map { Int(String($0))! }
let N = NM[0]; let M = NM[1]

func dfs(_ value: String, _ depth: Int) {
    if depth == M {
        print(value)
        return
    }
    for i in 1...N {
        dfs(value + "\(i) ", depth + 1)
    }
}

for i in 1...N {
    dfs("\(i) ", 1)
}
