let RC = readLine()!.split(separator: " ").map { Int(String($0))! }
let R = RC[0], C = RC[1]
var map = Array(repeating: [Int](), count: R)
let dy = [-1, 1, 0, 0]
let dx = [0, 0, -1, 1]
var answer = 0

for i in 0..<R {
    map[i] = readLine()!.map { Int($0.asciiValue!) - 65 }
}

func DFS(_ y: Int, _ x: Int, _ count: Int, _ alphabet: Int) {
    answer = max(answer, count)
    for i in 0..<4 {
        let nextY = y + dy[i]
        let nextX = x + dx[i]
        
        if nextY < 0 || nextY >= R || nextX < 0 || nextX >= C {
            continue
        }
        let n = 1 << map[nextY][nextX]
        if alphabet & n == 0 {
            DFS(nextY, nextX, count + 1, alphabet | n)
        }
    }
}

DFS(0, 0, 1, 1 << map[0][0])
print(answer)
