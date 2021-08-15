let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = NM[0]
let M = NM[1]
var map = Array(repeating: [Int](), count: N)
var house = [(Int, Int)]()
var chicken = [(Int, Int)]()
var visit = Array(repeating: false, count: 13)
var arr = Array(repeating: 0, count: M)
var answer = 0

for i in 0..<N {
    map[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
}

for i in 0..<N {
    for j in 0..<N {
        if map[i][j] == 1 {
            house.append((i, j))    
        } else if map[i][j] == 2 {
            chicken.append((i, j))
        }
    }
}
func distance(_ a: (Int, Int), _ b: (Int, Int)) -> Int {
    return abs(a.0 - b.0) + abs(a.1 - b.1)
}

func dfs(_ n: Int, _ m: Int, _ depth: Int) {
    if depth == m {
        var sum = 0
        for i in 0..<house.count {
            var minimum = 0
            for j in arr {
                if minimum == 0 {
                    minimum = distance(house[i], chicken[j])
                } else {
                    minimum = min(minimum, distance(house[i], chicken[j]))
                }
            }
            sum += minimum
        }
        if answer == 0 {
            answer = sum
        } else {
            answer = min(answer, sum)
        }
        return
    }
    for i in 0..<n {
        if visit[i] == false {
            visit[i] = true
            if depth != 0 {
                if arr[depth - 1] < i {
                    arr[depth] = i
                    dfs(n, m, depth + 1)
                }
            } else {
                arr[depth] = i
                dfs(n, m, depth + 1)
            }
            visit[i] = false
        }
    }
    return
}

dfs(chicken.count, M, 0)
print(answer)
