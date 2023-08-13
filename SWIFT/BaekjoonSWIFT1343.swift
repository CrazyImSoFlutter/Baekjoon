extension String {

    var length: Int {
        return count
    }

    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }

    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }

    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }

    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)), upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}

var board = readLine()!
var answer = ""
var count = 0

board += "."
for i in board {
    if i == "X" {
        count += 1
        if count == 4 {
            answer += "AAAA"
            count = 0
        }
    } else {
        if count == 2 {
            answer += "BB."
            count = 0
        } else if count == 0 {
            answer += "."
        } else {
            answer = "-1"
            break
        }
    }
}
if answer != "-1" {
    answer.remove(at: answer.index(before: answer.endIndex))
}
print(answer)
