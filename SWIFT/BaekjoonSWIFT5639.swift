var tree = [Int]()
var answer = [Int]()

while let line = readLine() {
    tree.append(Int(String(line))!)
}

func postOrder(_ start: Int, _ end: Int) {
    if start == end {
        return
    }

    if start == end - 1 {
        answer.append(tree[start])
        return
    }
    var index = start + 1
    while true {
        if !(index < end && tree[index] < tree[start]) {
            break
        }
        index += 1
    }
    postOrder(start + 1, index)
    postOrder(index, end)
    answer.append(tree[start])
}

postOrder(0, tree.count)
print(answer.map { String($0) }.joined(separator: "\n"))
