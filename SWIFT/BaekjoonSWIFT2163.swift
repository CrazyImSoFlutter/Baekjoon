let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = NM[0], M = NM[1]

print(N * M - 1)
