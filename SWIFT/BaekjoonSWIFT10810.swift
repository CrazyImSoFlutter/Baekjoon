let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = NM[0]
let M = NM[1]
var basket = Array(repeating: 0, count: N + 1)

for _ in 0..<M {
    let ijk = readLine()!.split(separator: " ").map { Int(String($0))! }
    let i = ijk[0]
    let j = ijk[1]
    let k = ijk[2]
    
    for n in i...j {
        basket[n] = k
    }
}

for i in 1...N {
    print(basket[i], terminator: " ")
}
