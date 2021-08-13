let num = readLine()!.split(separator: " ").map { Int(String($0))! }
let A = num[0]; let B = num[1]; let C = num[2];

func POW(_ A: Int, _ B: Int, _ C: Int) -> Int {
    if B == 1 { return A }
    var tmp = POW(A, B / 2, C)
    if B % 2 == 1 { return ((tmp * tmp) % C * A) % C }
    else if B % 2 == 0 { return (tmp * tmp) % C}
    return 0
}

print(POW(A % C, B, C))
