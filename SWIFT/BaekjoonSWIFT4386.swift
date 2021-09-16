import Foundation

func diagnol(_ a: (Double, Double), _ b: (Double, Double)) -> Double {
    let x = pow(a.0 - b.0, 2)
    let y = pow(a.1 - b.1, 2)
    
    return sqrt(x + y)
}

let n = Int(readLine()!)!
var star = Array(repeating: (0.0, 0.0), count: n)
var vertex = [(Int, Int, Double)]()
var count = 0
var answer = 0.0
for i in 0..<n {
    let tmp = readLine()!.split(separator: " ").map { Double(String($0))! }
    star[i] = (tmp[0], tmp[1])
}

for i in 0..<n {
    for j in i..<n {
        if i != j {
            vertex.append((i, j, diagnol(star[i], star[j])))
        }
    }
}

var parent = Array(repeating: 0, count: vertex.count)

for i in 0..<vertex.count {
    parent[i] = i
}

vertex.sort(by: { $0.2 < $1.2 })

func findParent(_ a: Int) -> Int {
    if a == parent[a] {
        return a
    } else {
        parent[a] = findParent(parent[a])
        return parent[a]
    }
}

func makeUnion(_ a: Int, _ b: Int) {
    let pa = findParent(a);
    let pb = findParent(b);

    if pa > pb {
        parent[pa] = pb
    } else if pa < pb {
        parent[pb] = pa
    }
}

func checkParent(_ a: Int, _ b: Int) -> Bool {
    let x = findParent(a)
    let y = findParent(b)

    if x == y {
        return true
    } else {
        return false
    }
}

for i in 0..<vertex.count {
    if !checkParent(vertex[i].0, vertex[i].1) {
        makeUnion(vertex[i].0, vertex[i].1)
        answer += vertex[i].2
    }
}

print(answer)
