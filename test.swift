let N = Int(readLine()!)!
var roadsideTree = Array(repeating: 0, count: N)
var currentGCD : Int = 0
var answer : Int = 0

for i in 0..<N {
    roadsideTree[i] = Int(readLine()!)!
}

let distance = roadsideTree.enumerated().map { (index, element) -> Int in
    if index != 0 {
        return roadsideTree[index] - roadsideTree[index - 1]
    }
    return 0
}

currentGCD = distance[0]

for i in 0..<N - 2 {
    currentGCD = GCD(a: currentGCD, b: distance[i + 1])
}

print(currentGCD)
print(distance)

distance.map { answer += ($0 / currentGCD) - 1  }
print(answer + 1)

func GCD(a: Int, b: Int) -> Int {
    let r : Int = a % b

    if (r == 0) {
        return b
    } else {
        let ret = GCD(a: b, b: r)
        return ret
    }
}
