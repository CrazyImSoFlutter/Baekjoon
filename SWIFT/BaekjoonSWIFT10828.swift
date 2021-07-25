struct Stack {
    var buf = Array(repeating: -1, count: 10001)
    var top = 0;

    mutating func InitStack() {
        top = -1;
    }

    mutating func IsFull() -> Bool {
        if top + 1 == 10001 {
            return true
        }
        return false
    }

    mutating func IsEmpty() -> Bool {
        if top == -1 {
            return true
        }
        return false
    }

    mutating func push(data: Int) {
        if self.IsFull() {
            return
        }
        top += 1
        buf[top] = data;
    }

    mutating func pop() -> Int {
        var re = 0
        if self.IsEmpty() {
            return -1
        }
        re = buf[top]
        top -= 1
        return re
    }
}

var N = Int(readLine()!)!
var data = 0
var stack = Stack()

stack.InitStack()
for i in 0..<N {
    var input = readLine()!
    if input[input.startIndex] == "p" {
        if input.contains("u") {
            var temp = input.split(separator: " ")
            stack.push(data: Int(temp[1])!)
        } else if input.contains("o") {
            print(stack.pop())
        }
    } else if input[input.startIndex] == "s" {
        print(stack.top + 1)
    } else if input[input.startIndex] == "e" {
        if stack.IsEmpty() {
            print(1)
        } else {
            print(0)
        }
    } else if input[input.startIndex] == "t" {
        if stack.IsEmpty() {
            print(-1)
        } else {
            print(stack.buf[stack.top])
        }
    }
}
