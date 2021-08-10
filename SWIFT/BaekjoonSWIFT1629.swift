let num = readLine()!.split(separator: " ").map { Int(String($0))! }
let A = num[0]; let B = num[1]; let C = num[2];
var pattern = [Int]()
var remain = 1
var answer = 0
var flag = true

while true {
    remain = (remain * (A % C)) % C
    print(remain)
    if remain == 0 {
        flag = false
        answer = 0
        break
    } else if remain == 1 {
        pattern.append(remain)
        break
    } else if pattern.contains(remain) {
        if pattern.last! == remain {
            answer = pattern.last!
            flag = false
        }
        break
    } else {
        pattern.append(remain)
    }  
}

if !flag {
    print(answer)
} else {
    answer = pattern[((B % pattern.count) - 1 + pattern.count) % pattern.count]
    print(answer)
}
