let N = Int(readLine()!)!
var map = [[Int]]()
var fish = [(Int, Int, Int)]()
var canEatFish = [(Int, Int, Int)]()
var babyShark = (0, 0, 2)
var index = 0
var visit = [[Int]]()
var BFSq = [(Int, Int)]()
let dy = [-1, 1, 0, 0]
let dx = [0, 0, -1, 1]
var answer = 0
var ateFish = 0
var endFlag = false
for i in 0..<N {
    map.append(readLine()!.split(separator: " ").map { Int(String($0))! })
    for j in 0..<N {
        if map[i][j] == 9 {
            babyShark = (i, j, 2)
            map[i][j] = 0
        }
    }
}
func findFish() {
    canEatFish = [(Int, Int, Int)]()
    for i in 0..<N {
        for j in 0..<N {
            if map[i][j] < babyShark.2, map[i][j] > 0 {
                canEatFish.append((i, j, map[i][j]))
            }
        }
    }
}

func chooseFish() {
    findFish()
    if canEatFish.isEmpty {
        endFlag = true
        return
    }
    visit = Array(repeating: Array(repeating: 0, count: N), count: N)
    BFSq = [(Int, Int)]()
    BFSq.append((babyShark.0, babyShark.1))
    index = 0
    var chosenFish = (0, 0, 0)
    while index < BFSq.count {
        let cur = BFSq[index]
        index += 1
        for i in 0..<4 {
            if cur.0 + dy[i] < 0 || cur.0 + dy[i] >= N || cur.1 + dx[i] < 0 || cur.1 + dx[i] >= N {
                continue
            }
            if map[cur.0 + dy[i]][cur.1 + dx[i]] <= babyShark.2 && visit[cur.0 + dy[i]][cur.1 + dx[i]] == 0 {
                visit[cur.0 + dy[i]][cur.1 + dx[i]] = visit[cur.0][cur.1] + 1
                BFSq.append((cur.0 + dy[i], cur.1 + dx[i]))
            }
        }
    }
    for i in canEatFish {
        if chosenFish == (0, 0, 0) {
            if visit[i.0][i.1] != 0 {
                chosenFish = (i.0, i.1, visit[i.0][i.1])
            }
        } else {
            if visit[i.0][i.1] != 0 {
                if chosenFish.2 > visit[i.0][i.1] {
                    chosenFish = (i.0, i.1, visit[i.0][i.1])
                } else if chosenFish.2 == visit[i.0][i.1] {
                    if chosenFish.0 > i.0 {
                        chosenFish = (i.0, i.1, visit[i.0][i.1])
                    } else if chosenFish.0 == i.0 {
                        if chosenFish.1 > i.1 {
                            chosenFish = (i.0, i.1, visit[i.0][i.1])
                        }
                    }
                }
            }
        }
    }
    if chosenFish.2 == 0 {
        endFlag = true
        return
    } else {
        ateFish += 1
        if ateFish == babyShark.2 {
            babyShark.2 += 1
            ateFish = 0
        }
        map[chosenFish.0][chosenFish.1] = 0
        babyShark.0 = chosenFish.0
        babyShark.1 = chosenFish.1
        answer += chosenFish.2
    }
}

while true {
    chooseFish()
    if endFlag == true {
        break
    }
}

print(answer)
