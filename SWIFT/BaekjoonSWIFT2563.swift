var paper = Array(repeating: Array(repeating: false, count: 100), count: 100)
var answer = 0
let N = Int(readLine()!)!

for _ in 0..<N {
    let xy = readLine()!.split(separator: " ").map { Int(String($0))! }
    let x = xy[0]
    let y = xy[1]
    
    for i in x..<x + 10 {
        for j in y..<y + 10 {
            paper[i][j] = true
        }
    }
}

paper.map { (colored) in
    colored.map { (color) in
        if color {
            answer += 1
        }
    }
}
print(answer)
