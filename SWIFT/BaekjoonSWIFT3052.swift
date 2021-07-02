var arr = [Int]()
var counter = [Int : Int]()

for _ in 0...9 {
    let a = Int(readLine()!)!
    arr.append(a)
}

for i in 0...9 {
    arr[i] = arr[i] % 42
}

arr.forEach{ counter[$0, default: 0] += 1 }
print(counter.count)
