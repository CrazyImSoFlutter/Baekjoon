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
    reverse(begin: i, end: j)
}

for i in 1...N {
    print(basket[i], terminator: " ")
}

func reverse(begin : Int, end : Int) {
    var i = begin
    var j = end
    while i < j {
        let tmp = basket[i]
        basket[i] = basket[j]
        basket[j] = tmp
        i += 1
        j -= 1
    }
}
