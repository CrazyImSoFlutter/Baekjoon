let AB = readLine()!.split(separator: " ").map { Int(String($0))! }
let CD = readLine()!.split(separator: " ").map { Int(String($0))! }
let A = AB[0]
let B = AB[1]
let C = CD[0]
let D = CD[1]



let denominator = (B * D / GCD(a: B, b: D))
let numerator = (B * D / GCD(a: B, b: D)) * A / B + (B * D / GCD(a: B, b: D)) * C / D

let divider = GCD(a: numerator, b: denominator)

print(numerator / divider, denominator / divider, terminator: " ")

func GCD(a: Int, b: Int) -> Int {
    let r : Int = a % b

    if (r == 0) {
        return b
    } else {
        let ret = GCD(a: b, b: r)
        return ret
    }
}
