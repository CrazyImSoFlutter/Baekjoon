let ESM =  readLine()!.split(separator: " ").map { Int(String($0))! }
var E = ESM[0], S = ESM[1], M = ESM[2]

while S != M || M != E {
    E += 15
    if E == S && S == M {
        break
    } else {
        if E > S {
            S += 28
        }
        if E > M {
            M += 19
        }
    }
}

print(M)
