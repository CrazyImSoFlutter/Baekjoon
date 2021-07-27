struct card {
    var buf = [Int]()
    var pointer = 0

    mutating func discard() {
        if buf.count > pointer {
            let item = buf[pointer]
            pointer += 1
            return
        } else {
            return 
        }
    }
    mutating func goBack() {
        if buf.count > pointer {
            let item = buf[pointer]
            pointer += 1
            buf.append(item)
        } else {
            return 
        }
    }
    func size() -> Int {
        return buf.count - pointer
    }
}

var N = Int(readLine()!)!
var c = card()

for i in 1...N {
    c.buf.append(i)
}

while true {
    if c.size() == 1 {
        print(c.buf[c.pointer])
        break
    }
    c.discard()
    if c.size() == 1 {
        print(c.buf[c.pointer])
        break
    }
    c.goBack()
}

