let MM = readLine()!.split(separator: " ").map { UInt64(String($0))! }
let MIN = MM[0]
let MAX = MM[1]
var answer = MAX - MIN + 1
var checker = Array(repeating: false, count: Int(answer))
var index: UInt64 = 2

while index * index <= MAX {
    var i = MIN / (index * index)

    if MIN % (index * index) != 0 {
        i += 1
    }
    while i * index * index <= MAX {
        if checker[Int(i * index * index - MIN)] == false {
            checker[Int(i * index * index - MIN)] = true
            answer -= 1
        }
        i += 1
    }
    index += 1
}

print(answer)

