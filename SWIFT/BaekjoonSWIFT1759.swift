let LC = readLine()!.split(separator: " ").map { Int(String($0))! }
let L = LC[0]
let C = LC[1]
var alphabet = [String]()
var consonant = [String]()
var vowel = [String]()
var visit = Array(repeating: false, count: C)
var arr = Array(repeating: "", count: L)

alphabet = readLine()!.split(separator: " ").map { String($0) }
for i in alphabet {
    if i == "a" || i == "e" || i == "i" || i == "o" || i == "u" {
        vowel.append(i)
    } else {
        consonant.append(i)
    }
}
alphabet.sort(by: <)

func dfs(_ n: Int, _ m: Int, _ depth: Int) {
    if depth == m {
        var vowelcount = 0
        for i in vowel {
            for j in arr {
                if i == j {
                    vowelcount += 1
                }
            }
        }
        if vowelcount >= 1 && m - vowelcount >= 2 {
            print(arr.joined(separator: ""))
        }
        return
    }
    for i in 0..<n {
        if visit[i] == false {
            visit[i] = true
            if depth != 0 {
                if arr[depth - 1] < alphabet[i] {
                    arr[depth] = alphabet[i]
                    dfs(n, m, depth + 1)
                }
            } else {
                arr[depth] = alphabet[i]
                dfs(n, m, depth + 1)
            }
            visit[i] = false
        }
    }
    return
}

dfs(C, L, 0)
