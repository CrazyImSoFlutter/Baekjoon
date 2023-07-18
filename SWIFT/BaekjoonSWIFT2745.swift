import Foundation

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

let NB = readLine()!.split(separator: " ").map { String($0) }
let N = NB[0]
let B = Int(NB[1])!
var BtoTen : Int = 0

for i in 0..<N.count {
    var a = Int(UnicodeScalar(N[i])!.value)
    let b = N.count - i - 1
    
    if a >= 48, a <= 57 {
        a -= 48
    } else {
        a -= 55
    }
    BtoTen += Int(pow(Double(B), Double(b))) * a
}

print(BtoTen)
