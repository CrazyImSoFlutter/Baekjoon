while true {
    let ABC = readLine()!.split(separator: " ").map { Int(String($0))! }
    let sortedABC = ABC.sorted(by: <)
    let A = sortedABC[0]
    let B = sortedABC[1]
    let C = sortedABC[2]
    
    if A == 0 || B == 0 || C == 0 {
        break
    }
    if C >= B + A {
        print("Invalid")
        continue
    }
    if A == B && B == C {
        print("Equilateral")
    } else if A != B && B != C && A != C {
        print("Scalene")
    } else {
        print("Isosceles")
    }
}
