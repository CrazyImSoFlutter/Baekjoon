let N = Int(readLine()!)!
var roadsideTree = Array(repeating: 0, count: N)
var distance = [Int]()
var currentGCD : Int = 0
var answer : Int = 0

for i in 0..<N {
    roadsideTree[i] = Int(readLine()!)!
    if i != 0 {
        distance.append(roadsideTree[i] - roadsideTree[i - 1])
    }
}

print(distance)

currentGCD = distance[0]
for i in 0..<N - 2 {
    currentGCD = GCD(a: currentGCD, b: distance[i + 1])
}

print(currentGCD)
distance.map { answer += ($0 / currentGCD) - 1  }
print(answer)

func GCD(a: Int, b: Int) -> Int {
    let r : Int = a % b

    if (r == 0) {
        return b
    } else {
        let ret = GCD(a: b, b: r)
        return ret
    }
}
