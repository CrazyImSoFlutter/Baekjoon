let N = Int(readLine()!)!
var data = Array(repeating: 0, count: 1000001)

func makeOne(_ num: Int) -> Int {
    if num == 1 {
        return 0
    } else if num == 2 {
        return 1
    }
    if data[num] != 0 {
        return data[num]
    } else {
        if num % 2 == 0 && num % 3 == 0 {
            data[num] = min(min(makeOne(num / 2) + 1, makeOne(num / 3) + 1), makeOne(num - 1) + 1)
            return data[num];
        } else if num % 2 == 0 && num % 3 != 0 {
            data[num] = min(makeOne(num / 2) + 1, makeOne(num - 1) + 1)
            return data[num]
        } else if num % 2 != 0 && num % 3 == 0 {
            data[num] = min(makeOne(num / 3) + 1, makeOne(num - 1) + 1)
            return data[num]
        } else if num % 2 != 0 && num % 3 != 0 {
            data[num] = makeOne(num - 1) + 1
            return data[num]
        }
    }
    return 0
}

print(makeOne(N))
