let NK = readLine()!.split(separator: " ").map { Int(String($0))! }
let MAX = 100001
let INF = 99999999
var dist = Array(repeating: INF, count: MAX)

func BFS(_ location: Int) -> Int {
    var index = 0
    var Q = [Int]()
    
    Q.append(location)
    dist[location] = 0
    while index < Q.count {
        let cur = Q[index]
        if cur == NK[1] {
            return dist[cur]
        }
        if cur + 1 < MAX {
            if dist[cur] + 1 < dist[cur + 1] {
                dist[cur + 1] = dist[cur] + 1
                Q.append(cur + 1)
            }
        }
        if cur - 1 >= 0 {
            if dist[cur] + 1 < dist[cur - 1] {
                dist[cur - 1] = dist[cur] + 1
                Q.append(cur - 1)
            }
        }
        if cur * 2 < MAX {
            if dist[cur] < dist[cur * 2] {
                dist[cur * 2] = dist[cur]
                Q.append(cur * 2)
            }
        }
        index += 1
    }
    return 10
}

print(BFS(NK[0]))
