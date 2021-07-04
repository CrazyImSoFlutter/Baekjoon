func selfNum(_ k: Int) -> Int {
    var sum = k
    var i = k
    while i > 0 {
        sum += (i % 10)
        i /= 10
    }
    return sum
}

var arr = Array(repeating: false, count: 10001)
for i in 1..<10001 {
    if selfNum(i) < 10001 {
        arr[selfNum(i)] = true
    }
}

for i in 1..<10001 {
    if arr[i] == false {
        print(i)
    }
}
