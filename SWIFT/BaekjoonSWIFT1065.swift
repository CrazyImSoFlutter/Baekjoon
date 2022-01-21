var N = Int(readLine()!)!
var counter = 0

func hansu(_ k: Int) -> Bool {
    var checker = 0
    let i = String(k)
    var arr = [Int]()
    for j in i {
        let a = Int(String(j))!
        arr.append(a)
    }
    checker = arr[0] - arr[1]
    for i in 0..<(arr.count - 1) {
        if checker != arr[i] - arr[i + 1] {
            return false
        }
    }
    return true
}

if N < 100 {
    print(N);
} else {
    counter += 99
    for i in 100...N {
        if hansu(i) == true {
            counter += 1
        }
    }
    print(counter)
}

