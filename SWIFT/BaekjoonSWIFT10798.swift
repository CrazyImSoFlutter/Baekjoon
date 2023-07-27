var words = Array(repeating: Array(repeating: "", count: 15), count: 5)

for i in 0..<5 {
    let S = Array(readLine()!)
    
    for j in 0..<S.count {
        words[i][j] = String(S[j])
    }
}

for i in 0..<15 {
    for j in 0..<5 {
        if words[j][i] != "" {
            print(words[j][i], terminator: "")
        }
    }
}
