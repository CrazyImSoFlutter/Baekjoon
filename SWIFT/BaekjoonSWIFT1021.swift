let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = input[0]
let M = input[1]
var arr = readLine()!.split(separator: " ").map { Int(String($0))! }
var q = [Int]()
var pointer = 0
var answer = 0

func moveRight() {
    pointer = (pointer + 1) % q.count
}

func moveLeft() {
    pointer = (pointer - 1 + q.count) % q.count
}

for i in 0..<N {
    q.append(i)
}

for i in 0..<arr.count {
    var left = 0
    var right = 0
    if q.firstIndex(of: arr[i] - 1)! > pointer {
        right = q.firstIndex(of: arr[i] - 1)! - pointer
        left = pointer + q.count - q.firstIndex(of: arr[i] - 1)!
    } else if q.firstIndex(of: arr[i] - 1)! < pointer {
        left = pointer - q.firstIndex(of: arr[i] - 1)!
        right = q.firstIndex(of: arr[i] - 1)! + q.count - pointer
    }

    if min(right, left) == right {
        for _ in 0..<right {
            moveRight()
            answer += 1
        }
    } else if min(right, left) == left {
        for _ in 0..<left {
            moveLeft()
            answer += 1
        }
    }
    if q.firstIndex(of: arr[i] - 1) == pointer {
        q.remove(at: pointer)
        if q.count != 0 && pointer == q.count {
            pointer = pointer % q.count
        }
    }
}
print(answer)
