import Foundation

let N = readLine()!
var arr = [Int]()
var pal = [Int]()
var nin = [Int]()

for i in N {
    arr.append(Int(String(i))!)
}

func makeBigger(_ mid1: Int, _ mid2: Int) {
    if pal[mid1] == 9 {
        pal[mid1] = 0
        pal[mid2] = 0
        makeBigger(mid1 - 1, mid2 + 1)
    } else {
        if mid1 != mid2 {
            pal[mid1] += 1
            pal[mid2] += 1
        } else {
            pal[mid1] += 1
        }
    }
}

func atoi(_ arr: [Int]) -> Int {
    var sum = 0
    for i in arr {
        sum *= 10
        sum += i
    }
    return sum
}

func nextPal() -> Int {
    pal = arr
    nin = Array(repeating: 9, count: arr.count) 

    if arr == nin {
        for i in 0..<arr.count {
            pal[i] = 0
        }
        pal.append(1)
        pal[0] = 1
        arr = pal
        return atoi(pal)
    }
    for i in (arr.count / 2)...(arr.count - 1) {
        pal[i] = arr[arr.count - i - 1]
    }
    if pal == arr {
        if pal.count % 2 == 0 {
            makeBigger(arr.count / 2 - 1, arr.count / 2)
            arr = pal
            return atoi(pal)
        } else {
            makeBigger(arr.count / 2, arr.count / 2)
            arr = pal
            return atoi(pal)
        }
    }
    for i in (arr.count / 2)...(arr.count - 1) {
        if pal[i] < arr[i] {
            if pal.count % 2 == 0 {
                makeBigger(arr.count / 2 - 1, arr.count / 2)
                arr = pal
                return atoi(pal)
            } else {
                makeBigger(arr.count / 2, arr.count / 2)
                arr = pal
                return atoi(pal)
            }
        } else if pal[i] > arr[i] {
            arr = pal
            return atoi(pal)
        }
    }
    arr = pal
    return 0
}

func primeChecker(_ pal: Int) -> Bool {
    if pal == 1 {
        return false
    } else if pal == 2 {
        return true
    } else if pal == 3 {
        return true
    }
    let root = Int(sqrt(Double(pal)))
    for i in 2...root {
        if pal % i == 0 {
            return false
        }
    }
    return true
}

while true {
    let tmp = atoi(arr)
    var flag = true
    for i in 0..<arr.count / 2 {
        if arr[i] != arr[arr.count - i - 1] {
            flag = false
            break
        }
    }
    if flag {
        if primeChecker(tmp) {
            print(tmp)
            break
        }
    }
    let answer = nextPal()
    if primeChecker(answer) {
        print(answer)
        break
    }
}
