let n = Int(readLine()!)!
let inOrder = readLine()!.split(separator: " ").map { Int(String($0))! }
let postOrder = readLine()!.split(separator: " ").map { Int(String($0))! }
var pos = Array(repeating: 0, count: n + 1)

func preOrder(_ inStart: Int, _ inEnd: Int, _ postStart: Int, _ postEnd: Int) {
    if inStart > inEnd || postStart > postEnd {
        return
    }
    let root = postOrder[postEnd]
    print("\(root) ", terminator: "")
    let p = pos[root]
    let left = p - inStart
    preOrder(inStart, p - 1, postStart, postStart + left - 1)
    preOrder(p + 1, inEnd, postStart + left, postEnd - 1)
}

for i in 0..<n {
    pos[inOrder[i]] = i
}
preOrder(0, n - 1, 0, n - 1)
