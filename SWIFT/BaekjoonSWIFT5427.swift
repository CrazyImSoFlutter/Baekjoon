let T = Int(readLine()!)!
let dy = [-1, 1, 0, 0]
let dx = [0, 0, -1 ,1]
for _ in 0..<T {
    let wh = readLine()!.split(separator: " ").map { Int(String($0))! }
    let w = wh[0], h = wh[1]
    var map = Array(repeating: [String](), count: h)
    var FireQ = [(Int, Int)]()
    var PlayerQ = [(Int, Int)]()
    var pVisit = Array(repeating: Array(repeating: 0, count: w), count: h)
    var fIndex = 0
    var pIndex = 0
    var answer = 0
    for i in 0..<h {
        map[i] = readLine()!.map { String($0) }
        for j in 0..<w {
            if map[i][j] == "@" {
                pVisit[i][j] = 1
                map[i][j] = "."
                PlayerQ.append((i, j))
            } else if map[i][j] == "*" {
                FireQ.append((i, j))
            }
        }
    }
    while true {
        var fSize = FireQ.count - fIndex
        var pSize = PlayerQ.count - pIndex
        
        if pSize == 0 {
            break
        }

        for _ in 0..<fSize {
            let cur = FireQ[fIndex]
            fIndex += 1
            for j in 0..<4 {
                if cur.0 + dy[j] < 0 || cur.0 + dy[j] >= h || cur.1 + dx[j] < 0 || cur.1 + dx[j] >= w {
                    continue
                }
                if map[cur.0 + dy[j]][cur.1 + dx[j]] == "." {
                    map[cur.0 + dy[j]][cur.1 + dx[j]] = "*"
                    FireQ.append((cur.0 + dy[j], cur.1 + dx[j]))
                }
            }
        }
        for _ in 0..<pSize {
            let cur = PlayerQ[pIndex]
            pIndex += 1
            for j in 0..<4 {
                if cur.0 + dy[j] < 0 || cur.0 + dy[j] >= h || cur.1 + dx[j] < 0 || cur.1 + dx[j] >= w {
                    continue
                }
                if map[cur.0 + dy[j]][cur.1 + dx[j]] == "." && pVisit[cur.0 + dy[j]][cur.1 + dx[j]] == 0 {
                    pVisit[cur.0 + dy[j]][cur.1 + dx[j]] = pVisit[cur.0][cur.1] + 1
                    PlayerQ.append((cur.0 + dy[j], cur.1 + dx[j]))
                }
            }
        }
    }
    for i in 0..<h {
        if answer == 0 {
            if pVisit[i][0] != 0 {
                answer = pVisit[i][0]
            }
            if pVisit[i][w - 1] != 0 {
                answer = pVisit[i][w - 1]
            }
        } else {
            if pVisit[i][0] != 0 && pVisit[i][w - 1] != 0 {
                answer = min(answer, pVisit[i][0], pVisit[i][w - 1])
            } else if pVisit[i][0] == 0 && pVisit[i][w - 1] != 0 {
                answer = min(answer, pVisit[i][w - 1])
            } else if pVisit[i][0] != 0 && pVisit[i][w - 1] == 0 {
                answer = min(answer, pVisit[i][0])
            }
        }
    }
    for i in 0..<w {
        if answer == 0 {
            if pVisit[0][i] != 0 {
                answer = pVisit[0][i]
            }
            if pVisit[h - 1][i] != 0 {
                answer = pVisit[h - 1][i]
            }
        } else {
            if pVisit[0][i] != 0 && pVisit[h - 1][i] != 0 {
                answer = min(answer, pVisit[0][i], pVisit[h - 1][i])
            } else if pVisit[0][i] == 0 && pVisit[h - 1][i] != 0 {
                answer = min(answer, pVisit[h - 1][i])
            } else if pVisit[0][i] != 0 && pVisit[h - 1][i] == 0 {
                answer = min(answer, pVisit[0][i])
            }
        }
    }
    if answer == 0 {
        print("IMPOSSIBLE")
    } else {
        print(answer)
    }
}

