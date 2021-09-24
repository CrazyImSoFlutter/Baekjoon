let N = Int(readLine()!)!
var weight = readLine()!.split(separator: " ").map { Int(String($0))! }

weight.sort()

if weight[0] != 1 {
    print(1)
} else {
    var sum = weight[0]

    for i in 1..<N {
        if weight[i] > sum + 1 {
            break
        }
        sum += weight[i]
    }
    print(sum + 1)
}
