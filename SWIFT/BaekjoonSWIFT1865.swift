var answer = ""
let INF = 2000000000
for _ in 0..<Int(readLine()!)! {

    let NMW = readLine()!.split(separator: " ").map { Int(String($0))! }
    let N = NMW[0], M = NMW[1], W = NMW[2]
    var road = [(Int, Int, Int)]()
    var flag = false

    for _ in 0..<M {
        let SET = readLine()!.split(separator: " ").map { Int(String($0))! }
        road.append((SET[0], SET[1], SET[2]))
        road.append((SET[1], SET[0], SET[2]))
    }
    for _ in 0..<W {
        let SET = readLine()!.split(separator: " ").map { Int(String($0))! }
        road.append((SET[0], SET[1], -SET[2]))
    }
    
    for i in 1...N {
        if bellmanFord(i, road, N, M * 2 + W) {
            flag = true
            answer += "YES\n"
            break
        }
    }
    if !flag {
        answer += "NO\n"
    }
}

print(answer)

func bellmanFord(_ start: Int, _ road: [(Int, Int, Int)], _ N: Int, _ roadcount: Int) -> Bool {
    var dist = Array(repeating: INF, count: N + 1)
    var flag = false
    dist[start] = 0

    for _ in 1..<N {
        flag = false
        for j in 0..<roadcount {
            let u = road[j].0
            let v = road[j].1
            let w = road[j].2
            if dist[u] != INF && dist[u] + w < dist[v] {
                dist[v] = dist[u] + w
                flag = true
            }
        }
        if !flag {
            break
        }
    }
    if flag {
        for j in 0..<roadcount {
            let u = road[j].0
            let v = road[j].1
            let w = road[j].2

            if dist[u] != INF && dist[u] + w < dist[v] {
                return true
            }
        }
    }
    return false
}
