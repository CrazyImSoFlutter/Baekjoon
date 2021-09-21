let N = Int(readLine()!)!
let K = Int(readLine()!)!
let MAX = 1000000
var KArr = Array(repeating: Array(repeating: 0, count: 101), count: 101)
var parent = Array(repeating: 0, count: 101)
var rep = Array(repeating: 0, count: 101)
var rev = Array(repeating: 0, count: 101)

for i in 1...N {
    for j in 1...N {
        KArr[i][j] = MAX
    }
    rev[i] = MAX
    rep[i] = -1
    parent[i] = i
    KArr[i][i] = 0
}

for _ in 0..<K {
    let tmp = readLine()!.split(separator: " ").map { Int(String($0))! }
    KArr[tmp[0]][tmp[1]] = 1
    KArr[tmp[1]][tmp[0]] = 1
    let p1 = find(tmp[0])
    let p2 = find(tmp[1])
    if p1 != p2 {
        parent[p1] = p2
    }
}

func find(_ a: Int) -> Int {
    if parent[a] == a {
        return a
    }
    parent[a] = find(parent[a])
    return parent[a]
}

for i in 1...N {
    for j in 1...N {
        for k in 1...N {
            if KArr[j][i] + KArr[i][k] < KArr[j][k] {
                KArr[j][k] = KArr[j][i] + KArr[i][k]
            }
        }
    }
}

for i in 1...N {
    let p1 = find(i)
    var m = -1
    for j in 1...N {
        if KArr[i][j] == MAX {
            continue
        }
        if m < KArr[i][j] {
            m = KArr[i][j]
        }
    }
    if rev[p1] > m {
        rev[p1] = m
        rep[p1] = i
    }
}

var answer = [Int]()
for i in 1...N {
    if rep[i] != -1 {
        answer.append(rep[i])
    }
}
answer.sort()
print(answer.count)
print(answer.map { String($0) }.joined(separator: "\n"))


