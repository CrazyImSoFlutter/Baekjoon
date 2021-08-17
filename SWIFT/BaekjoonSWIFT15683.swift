let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = NM[0]
let M = NM[1]
var cctvs = Array(repeating: [(Int, Int, Int, Int)](), count: 5)
var office = Array(repeating: [Int](), count: N)
var cctv = [(Int, Int, Int)]()

cctvs[0] = [(1, 0, 0, 0), (0, 1, 0, 0), (0, 0, 1, 0), (0, 0, 0, 1)]
cctvs[1] = [(1, 1, 0, 0), (0, 0, 1, 1)]
cctvs[2] = [(1, 0, 1, 0), (1, 0, 0, 1), (0, 1, 1, 0), (0, 1, 0, 1)]
cctvs[3] = [(1, 1, 1, 0), (1, 1, 0, 1), (1, 0, 1, 1), (0, 1, 1, 1)]
cctvs[4] = [(1, 1, 1, 1)]

for i in 0..<N {
    office[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
}

for i in 0..<N {
    for j in 0..<M {
        if (1...5).contains(office[i][j]) {
            cctv.append((i, j, office[i][j]))
        }
    }
}
cctv.sort(by: { $0.2 < $1.2 })
var arr = Array(repeating: 0, count: cctv.count)
var answer = 1000
func dfs(_ depth: Int) {
    if depth == cctv.count {
        var map = office
        for i in 0..<cctv.count {
            var count = 0
            var command = cctvs[cctv[i].2 - 1][arr[i]]
            var direction = Array(repeating: cctv[i], count: 4)
            var flag = Array(repeating: true, count: 4)
            while true {
                if !flag.contains(true) {
                    break
                }
                if command.0 == 0 {
                    flag[0] = false
                }
                if command.1 == 0 {
                    flag[1] = false
                }
                if command.2 == 0 {
                    flag[2] = false
                }
                if command.3 == 0 {
                    flag[3] = false
                }
                if direction[0].0 - command.0 >= 0 {
                    if map[direction[0].0 - command.0][direction[0].1] == 6 {
                        command.0 = 0
                    } else {
                        direction[0].0 -= command.0
                    }
                } else {
                    command.0 = 0
                }
                if direction[1].0 + command.1 < N {
                    if map[direction[1].0 + command.1][direction[1].1] == 6 {
                        command.1 = 0
                    } else {
                        direction[1].0 += command.1
                    }
                } else {
                    command.1 = 0
                }
                if direction[2].1 - command.2 >= 0 {
                    if map[direction[2].0][direction[2].1 - command.2] == 6 {
                        command.2 = 0
                    } else {
                        direction[2].1 -= command.2
                    }
                } else {
                    command.2 = 0
                }
                if direction[3].1 + command.3 < M {
                    if map[direction[3].0][direction[3].1 + command.3] == 6 {
                        command.3 = 0
                    } else {
                        direction[3].1 += command.3
                    }
                } else {
                    command.3 = 0
                }
                for i in 0..<4 {
                    map[direction[i].0][direction[i].1] = -1
                }
            }
            for a in 0..<N {
                for b in 0..<M {
                    if map[a][b] == 0 {
                        count += 1
                    }
                }
            }
            if answer >= count {
                answer = count
            }
        }
        return
    }
    for i in 0..<cctvs[cctv[depth].2 - 1].count {
        arr[depth] = i
        dfs(depth + 1)
    }
}

dfs(0)
if cctv.count == 0 {
    var count = 0
    for i in 0..<N {
        for j in 0..<M {
            if office[i][j] == 0 {
                count += 1
            }
        }
    }
    answer = count
}
print(answer)
