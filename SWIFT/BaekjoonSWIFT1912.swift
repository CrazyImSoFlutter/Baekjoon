let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int(String($0))! }
var answer = 0
var sum = 0
var flag = false
var bigM = -1000

func solve() {
    for i in arr {
        if i > 0 
    }
}




for i in arr {
    if i > 0 {
        flag = true
        if sum < 0 {
            sum = i
        } else {
            sum += i
            if answer < sum {
                answer = sum
            }
        }
    } else {
        if bigM <= i {
            bigM = i
        }
        if sum < 0 {
            continue
        } else {
            if answer < sum {
                answer = sum
            }
            sum += i
        }
    }
}

if !flag {
    print(bigM)
} else {
    print(answer)
}
