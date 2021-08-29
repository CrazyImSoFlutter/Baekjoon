let N = Int(readLine()!)!
var binaryTree = Array(repeating: [Int](), count: N + 1)
var visit = Array(repeating: false, count: N + 1)
var preOrderArr = [Character]()
var inOrderArr = [Character]()
var postOrderArr = [Character]()

for _ in 0..<N {
    let input = readLine()!
    var tmp = [Character]()
    for i in input {
        if i == " " {
            continue
        }
        tmp.append(i)
    }
    binaryTree[Int(tmp[0].asciiValue! - 64)] = [tmp[1] == "." ? 0 : Int(tmp[1].asciiValue! - 64), tmp[2] == "." ? 0 : Int(tmp[2].asciiValue! - 64)]
}

func preOrderSearch(_ node: Int) {
    visit[node] = true
    preOrderArr.append(Character(UnicodeScalar(node + 64)!))
    for i in 0..<2 {
        if binaryTree[node][i] == 0 {
            continue
        }
        if visit[binaryTree[node][i]] == true {
            continue
        }
        preOrderSearch(binaryTree[node][i])
    }
}

func inOrderSearch(_ node: Int) {
    if binaryTree[node][0] != 0 && binaryTree[node][1] != 0 {
        inOrderSearch(binaryTree[node][0])
        inOrderArr.append(Character(UnicodeScalar(node + 64)!))
        inOrderSearch(binaryTree[node][1])
    } else if binaryTree[node][0] == 0 && binaryTree[node][1] != 0 {
        inOrderArr.append(Character(UnicodeScalar(node + 64)!))
        inOrderSearch(binaryTree[node][1])
    } else if binaryTree[node][0] != 0 && binaryTree[node][1] == 0 {
        inOrderSearch(binaryTree[node][0])
        inOrderArr.append(Character(UnicodeScalar(node + 64)!))
    } else {
        inOrderArr.append(Character(UnicodeScalar(node + 64)!))
    }
}

func postOrderSearch(_ node: Int) {
    if binaryTree[node][0] != 0 && binaryTree[node][1] != 0 {
        postOrderSearch(binaryTree[node][0])
        postOrderSearch(binaryTree[node][1])
        postOrderArr.append(Character(UnicodeScalar(node + 64)!))
    } else if binaryTree[node][0] == 0 && binaryTree[node][1] != 0 {
        postOrderSearch(binaryTree[node][1])
        postOrderArr.append(Character(UnicodeScalar(node + 64)!))
    } else if binaryTree[node][0] != 0 && binaryTree[node][1] == 0 {
        postOrderSearch(binaryTree[node][0])
        postOrderArr.append(Character(UnicodeScalar(node + 64)!))
    } else {
        postOrderArr.append(Character(UnicodeScalar(node + 64)!))
    }

}

preOrderSearch(1)
inOrderSearch(1)
postOrderSearch(1)
print(preOrderArr.map { String($0) }.joined(separator: ""))
print(inOrderArr.map { String($0) }.joined(separator: ""))
print(postOrderArr.map { String($0) }.joined(separator: ""))
