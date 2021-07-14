let N = Int(readLine()!)!

var groupWord = 0
for _ in 0..<N {
    let word = readLine()!
    var error = 0
    var arr = [Character]()
    for i in word {
        arr.append(i)
    }
    for i in 0..<(arr.count - 1) {
        if arr[i] != arr[i + 1] {
            var newArr = [Character]()
            for j in (i + 1)..<word.count {
                newArr.append(arr[j])
            }
            if newArr.contains(arr[i]) {
                error += 1
            }
        }
    }
    if error == 0 {
        groupWord += 1
    }
}
print(groupWord)
