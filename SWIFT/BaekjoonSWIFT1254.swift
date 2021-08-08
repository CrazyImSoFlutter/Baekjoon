let S = readLine()!
var arr = [Character]()
var answer = 0
var flag1 = true
var flag2 = true

for i in S {
    arr.append(i)
}

for i in stride(from: arr.count - 1, through: arr.count / 2, by: -1) {
    flag1 = true
    flag2 = true
    if arr.count == 1 {
        answer = 1
        break
    }
    if i == arr.count - 1 {
        if arr[i] == arr[i - 1] {
            answer = i * 2
            continue
        } else {
            answer = i * 2 + 1
            continue
        }
    } else {
        for j in 1...arr.count - i - 1 {
            if arr[i - j] != arr[i + j] {
                flag1 = false
                break
            }
        }
        if arr.count % 2 == 1 && i == arr.count / 2 {
            flag2 = false
        } else {
            for j in 0...arr.count - i - 1 {
                if arr[i - j - 1] != arr[i + j] {
                    flag2 = false
                    break
                }
            }
        }
    }
    if !flag1 && !flag2 {
        continue
    } else if flag1 && flag2 {
        answer = i * 2
    } else if flag1 && !flag2 {
        answer = i * 2 + 1
    } else if flag2 && !flag1 {
        answer = i * 2
    }
}

print(answer)
