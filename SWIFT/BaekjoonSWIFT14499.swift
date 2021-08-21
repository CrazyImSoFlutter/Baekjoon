let NMxyK = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = NMxyK[0]
let M = NMxyK[1]
let x = NMxyK[2]
let y = NMxyK[3]
let K = NMxyK[4]
var map = Array(repeating: [Int](), count: N)
for i in 0..<N {
    map[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
}
var command = readLine()!.split(separator: " ").map { Int(String($0))! }
var dice = Array(repeating: Array(repeating: -1, count : 4), count: 4)
var form = true
var pos = (x, y)
var commandFlag = true

dice[0][1] = 0
dice[1][1] = 0
dice[2][1] = 0
dice[3][1] = 0
dice[1][0] = 0
dice[1][2] = 0

func canGo(_ pos: (Int, Int)) -> Bool {
    if pos.0 < 0 || pos.0 >= N || pos.1 < 0 || pos.1 >= M {
        return false
    }
    return true
}

func roll(_ direction: Int) {
    if direction == 1 {
        if canGo((pos.0, pos.1 + 1)) {
            pos.1 += 1
        } else {
            commandFlag = false
            return
        }
        if form == true {
            form = false
            dice[1][3] = dice[3][1]
            dice[3][1] = -1
        }
        let tmp = dice[1][0]
        for i in 0...2 {
            dice[1][i] = dice[1][i + 1]
        }
        dice[1][3] = tmp
    } else if direction == 2 {
        if canGo((pos.0, pos.1 - 1)) {
            pos.1 -= 1
        } else {
            commandFlag = false
            return
        }
        if form == true {
            form = false
            dice[1][3] = dice[3][1]
            dice[3][1] = -1
        }
        let tmp = dice[1][3]
        for i in stride(from: 3, through: 1, by: -1) {
            dice[1][i] = dice[1][i - 1]
        }
        dice[1][0] = tmp
    } else if direction == 3 {
        if canGo((pos.0 - 1, pos.1)) {
            pos.0 -= 1
        } else {
            commandFlag = false
            return
        }
        if form == false {
            form = true
            dice[3][1] = dice[1][3]
            dice[1][3] = -1
        }
        let tmp = dice[3][1]
        for i in stride(from: 3, through: 1, by: -1) {
            dice[i][1] = dice[i - 1][1]
        }
        dice[0][1] = tmp
    } else if direction == 4 {
        if canGo((pos.0 + 1, pos.1)) {
            pos.0 += 1
        } else {
            commandFlag = false
            return
        }
        if form == false {
            form = true
            dice[3][1] = dice[1][3]
            dice[1][3] = -1
        }
        let tmp = dice[0][1]
        for i in 0...2 {
            dice[i][1] = dice[i + 1][1]
        }
        dice[3][1] = tmp
    }
}

for i in command {
    commandFlag = true
    roll(i)
    if commandFlag == true {
        if map[pos.0][pos.1] == 0 {
            map[pos.0][pos.1] = dice[1][1]
        } else {
            dice[1][1] = map[pos.0][pos.1]
            map[pos.0][pos.1] = 0
        }
    } else {
        continue
    }
    if form == true {
        print(dice[3][1])
    } else {
        print(dice[1][3])
    }
}
