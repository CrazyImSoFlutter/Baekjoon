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


let word = readLine()!
var answer = "{"

for i in 0..<word.count - 2 {
    for j in i+1..<word.count - 1 {
        var madeWord = ""
        
        for k in stride(from: i, to: -1, by: -1) {
            madeWord += word[k]
        }
        for k in stride(from: j, to: i, by: -1) {
            madeWord += word[k]
        }
        for k in stride(from: word.count - 1, to: j, by: -1) {
            madeWord += word[k]
        }
        
        if madeWord < answer {
            answer = madeWord
        }
    }
}

print(answer)
