let N = Int(readLine()!)!
var RGB = Array(repeating: [String](), count: N)
var V = Array(repeating: Array(repeating: false, count: N), count: N)
let dy = [1, -1, 0, 0]
let dx = [0, 0, 1, -1]
var Q = [(Int, Int)]()
var I = 0
var R = 0
var G = 0
var B = 0
var RG = 0
var BB = 0

for i in 0..<N {
    RGB[i] = readLine()!.map { String($0) }
}

for i in 0..<N {
    for j in 0..<N {
        Q = [(Int, Int)]()
        I = 0
        if V[i][j] == false {
            V[i][j] = true
            Q.append((i, j))
            findArea(RGB[i][j])
        }
    }
}

V = Array(repeating: Array(repeating: false, count: N), count: N)
for i in 0..<N {
    for j in 0..<N {
        Q = [(Int, Int)]()
        I = 0
        if V[i][j] == false {
            V[i][j] = true
            Q.append((i, j))
            findArea2(RGB[i][j])
        }
    }
}

func findArea(_ C: String) {
    while I < Q.count {
        let cur = Q[I]
        I += 1
        for k in 0..<4 {
            let qY = cur.0 + dy[k]
            let qX = cur.1 + dx[k]
            if qY < 0 || qY >= N || qX < 0 || qX >= N {
                continue
            }
            if !V[qY][qX] && RGB[qY][qX] == C {
                V[qY][qX] = true
                Q.append((qY, qX))
            }
        }
    }
    if C == "R" {
        R += 1
    } else if C == "G" {
        G += 1
    } else {
        B += 1
    }
}

func findArea2(_ C: String) {
    while I < Q.count {
        let cur = Q[I]
        I += 1
        for k in 0..<4 {
            let qY = cur.0 + dy[k]
            let qX = cur.1 + dx[k]
            if qY < 0 || qY >= N || qX < 0 || qX >= N {
                continue
            }
            if C == "R" || C == "G" {
                if !V[qY][qX] && (RGB[qY][qX] == "R" || RGB[qY][qX] == "G") {
                    V[qY][qX] = true
                    Q.append((qY, qX))
                }
            } else {
                if !V[qY][qX] && RGB[qY][qX] == C {
                    V[qY][qX] = true
                    Q.append((qY, qX))
                }
            }

        }
    }
    if C == "R" || C == "G" {
        RG += 1
    } else {
        BB += 1
    }
}

print(R + G + B, RG + BB)
