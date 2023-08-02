let N = Int(readLine()!)!
let students = readLine()!.split(separator: " ").map { Int(String($0))! }
var stack = [Int]()
var currentNum = 1

for i in students {
    if i == currentNum {
        currentNum += 1
    } else if !stack.isEmpty && stack.last! == currentNum {
        stack.popLast()
        currentNum += 1
    } else {
        stack.append(i)
    }
    while !stack.isEmpty && stack.last! == currentNum {
        stack.popLast()
        currentNum += 1
    }
}

if stack.isEmpty {
    print("Nice")
} else {
    print("Sad")
}
