let ABC = readLine()!.split(separator: " ").map { Int(String($0))! }
let A = ABC[0], B = ABC[1], C = ABC[2]

if B >= C {
    print(-1)
} else {
    print(1 + A / (C - B))
}
