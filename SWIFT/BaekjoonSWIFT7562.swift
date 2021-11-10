for _ in 0..<Int(readLine()!)! {
    let I = Int(readLine()!)!
    let K = readLine()!.split(separator: " ").map { Int(String($0))! }
    let D = readLine()!.split(separator: " ").map { Int(String($0))! }
    var V = Array(repeating: Array(repeating: false, count: I), count: I)
    let dy = [2, 1, -1, -2, -2, -1, 1, 2]
    let dx = [1, 2, 2, 1, -1, -2, -2, -1]
    var Q = [(Int, Int, Int)]()
    var index = 0

    Q.append((K[0], K[1], 0))
    V[K[0]][K[1]] = true
    while index < Q.count {
        let cur = Q[index]
        
        index += 1
        if cur.0 == D[0] && cur.1 == D[1] {
            print(cur.2)
            break
        }
        for i in 0..<8 {
            let y = cur.0 + dy[i]
            let x = cur.1 + dx[i]

            if y < 0 || y >= I || x < 0 || x >= I {
                continue
            }
            if V[y][x] == false {
                Q.append((y, x, cur.2 + 1))
                V[y][x] = true
            }
        }
    }
}

