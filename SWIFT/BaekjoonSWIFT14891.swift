import Foundation

var gear = Array(repeating: [String](), count: 4)
for i in 0..<4 {
    let tmp = readLine()!
    for j in tmp {
        if j == "1" {
            gear[i].append("S")
        } else {
            gear[i].append("N")
        }
    }
}
let K = Int(readLine()!)!
var command = [(Int, Int)]()
for _ in 0..<K {
    let tmp = readLine()!.split(separator: " ").map { Int(String($0))! }
    command.append((tmp[0], tmp[1]))
}
var spinChecker = [(Bool, Int)]()
var visit = [Bool]()
var answer = 0

func spinWhat(_ command: (Int, Int)) {
    if command.0 == 1 {
        if visit[0] == false {
            visit[0] = true
            spinChecker[0].0 = true
            spinChecker[0].1 = command.1
            if gear[0][2] != gear[1][6] {
                spinWhat((2, command.1 * (-1)))
            }
        }
    } else if command.0 == 2 {
        if visit[1] == false {
            visit[1] = true
            spinChecker[1].0 = true
            spinChecker[1].1 = command.1
            if gear[1][6] != gear[0][2] {
                spinWhat((1, command.1 * (-1)))
            }
            if gear[1][2] != gear[2][6] {
                spinWhat((3, command.1 * (-1)))
            }
        }
    } else if command.0 == 3 {
        if visit[2] == false {
            visit[2] = true
            spinChecker[2].0 = true
            spinChecker[2].1 = command.1
            if gear[2][6] != gear[1][2] {
                spinWhat((2, command.1 * (-1)))
            }
            if gear[2][2] != gear[3][6] {
                spinWhat((4, command.1 * (-1)))
            }
        }
    } else if command.0 == 4 {
        if visit[3] == false {
            visit[3] = true
            spinChecker[3].0 = true
            spinChecker[3].1 = command.1
            if gear[3][6] != gear[2][2] {
                spinWhat((3, command.1 * (-1)))
            }
        }
    }
}

func spin(_ command: (Int, Int)) {
    var tmp = ""
    if command.1 == 1 {
        tmp = gear[command.0 - 1][7]
        for i in stride(from: 7, to: 0, by: -1) {
            gear[command.0 - 1][i] = gear[command.0 - 1][i - 1]
        }
        gear[command.0 - 1][0] = tmp
    } else {
        tmp = gear[command.0 - 1][0]
        for i in stride(from: 0, to: 7, by: 1) {
            gear[command.0 - 1][i] = gear[command.0 - 1][i + 1]
        }
        gear[command.0 - 1][7] = tmp
    }
}

func spinAll(_ command: (Int, Int)) {
    spinChecker = Array(repeating: (false, 1), count: 4)
    visit = Array(repeating: false, count: 4)
    spinWhat(command)
    for i in 0..<4 {
        if spinChecker[i].0 == false {
            continue
        }
        spin((i + 1, spinChecker[i].1))
    }
}

for i in 0..<K {
    spinAll(command[i])
}

for i in 0..<4 {
    if gear[i][0] == "S" {
        answer += Int(pow(Double(2), Double(i)))
    }
}
print(answer)
