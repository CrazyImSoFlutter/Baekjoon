let N = Int(readLine()!)!
var candy = Array(repeating: [String](), count: N)
let dy = [1, 0]
let dx = [0, 1]
var answer = 0

for i in 0..<N {
    candy[i] = readLine()!.map{ String($0) }
}

func findMax(_ map: [[String]]) -> Int {
    var maxCandy = 1
    var tmp = 1

    for i in 0..<N {
        tmp = 1
        for j in 0..<N - 1 {
            if map[i][j] == map[i][j + 1] {
                tmp += 1
            } else {
                tmp = 1
            }
            maxCandy = max(maxCandy, tmp)
        }
    }
    for i in 0..<N {
        tmp = 1
        for j in 0..<N - 1 {
            if map[j][i] == map[j + 1][i] {
                tmp += 1
            } else {
                tmp = 1
            }
            maxCandy = max(maxCandy, tmp)
        }      
    }
    return maxCandy
}

for i in 0..<N {
    for j in 0..<N {
        for k in 0..<2 {
            var tmp = candy
            var tmpCandy = ""
            if i + dy[k] < 0 || i + dy[k] >= N || j + dx[k] < 0 || j + dx[k] >= N {
                continue
            }
            tmpCandy = tmp[i][j]
            tmp[i][j] = tmp[i + dy[k]][j + dx[k]]
            tmp[i + dy[k]][j + dx[k]] = tmpCandy
            answer = max(answer, findMax(tmp))
        }
    }
}

print(answer)
