let AB = readLine()!.split(separator: " ").map { Int(String($0))! }
let A = AB[0]
let B = AB[1]

func GCD(a: Int, b: Int) -> Int {
    let r : Int = a % b

    if (r == 0) {
        return b
    } else {
        let ret = GCD(a: b, b: r)
        return ret
    }
}

print(A * B / GCD(a: A, b: B))
