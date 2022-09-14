var T = Int(readLine()!)!
var inputStr: [String] = []
var count = 0

for _ in 0..<T {
    inputStr.append(readLine()!)
}

func checkPal(_ s: String) -> Int {
    let strArr = Array(s).map{ String($0) }
    var flag = 1
    var left = 0
    var right = s.count - 1

    while left <= right {
        count += 1
        if strArr[left] != strArr[right] {
            flag = 0
            break
        }
        left += 1
        right -= 1
    }
    if flag == 1 && s.count % 2 == 0 {
        count += 1
    }
    return flag
}

for i in inputStr {
    print(checkPal(i), count)
    count = 0
}
