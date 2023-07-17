let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = NM[0]
let M = NM[1]
var basket = [Int]()

for i in 0...N {
    basket.append(i)
}

for _ in 0..<M {
    let ij = readLine()!.split(separator: " ").map { Int(String($0))! }
    let i = ij[0]
    let j = ij[1]
    var tmp = 0
    
    tmp = basket[i]
    basket[i] = basket[j]
    basket[j] = tmp
}

for i in 1...N {
    print(basket[i], terminator: " ")
}
