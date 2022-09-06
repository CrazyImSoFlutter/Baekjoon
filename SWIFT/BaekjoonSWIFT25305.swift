let Nk = readLine()!.split(separator: " ").map { Int(String($0))! }
var X = readLine()!.split(separator: " ").map { Int(String($0))! }

X.sort(by: >)
print(X[Nk[1] - 1])

