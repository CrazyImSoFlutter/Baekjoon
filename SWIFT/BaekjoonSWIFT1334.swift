import Foundation

let a = readLine()!
var arr : [Int] = [Int]()
var pal : [Int] = [Int]()
var nin : [Int] = [Int]()

func makeBigger(_ pal: inout [Int], _ mid1: Int, _ mid2: Int) {
    if pal[mid1] == 9 {
        pal[mid1] = 0
        pal[mid2] = 0
        makeBigger(&pal, mid1 - 1, mid2 + 1)
    } else {
        if mid1 != mid2 {
            pal[mid1] += 1
            pal[mid2] += 1
        } else {
            pal[mid1] += 1
        }
    }
}

func printAnswer(_ pal: [Int]) {
    for i in 0..<pal.count - 1 {
        print(pal[i], terminator: "")
    }
    print(pal[pal.count - 1])
}

for i in a {
    let b = Int(String(i))!
    arr.insert(b, at: arr.count)
    pal.insert(b, at: pal.count)
    nin.insert(9, at: nin.count)
}

if arr == nin {
    for i in 0..<arr.count {
        pal[i] = 0
    }
    pal.insert(0, at: pal.count)
    pal[0] = 1
    pal[pal.count - 1] = 1
    printAnswer(pal)
    exit(0)
}

for i in (arr.count / 2)...(arr.count - 1) {
    pal[i] = arr[arr.count - i - 1]
}
if pal == arr {
    if pal.count % 2 == 0 {
        makeBigger(&pal, arr.count / 2 - 1, arr.count / 2)
        printAnswer(pal)
        exit(0)
    } else {
        makeBigger(&pal, arr.count / 2, arr.count / 2)
        printAnswer(pal)
        exit(0)
    }
}

for i in (arr.count / 2)...(arr.count - 1) {
    if pal[i] < arr[i] {
        if pal.count % 2 == 0 {
            makeBigger(&pal, arr.count / 2 - 1, arr.count / 2)
            printAnswer(pal)
            exit(0)
        } else {
            makeBigger(&pal, arr.count / 2, arr.count / 2)
            printAnswer(pal)
            exit(0)
        }
    } else if pal[i] > arr[i] {
        printAnswer(pal)
        exit(0)
    }
}

printAnswer(pal)
