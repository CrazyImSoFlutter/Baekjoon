let firstDay = readLine()!.split(separator: " ").map { Int(String($0))! }
let secondDay = readLine()!.split(separator: " ").map { Int(String($0))! }
let months: [Int] = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

func isLeap(_ year: Int) -> Bool {
    if year % 400 == 0 {
        return true
    } else if year % 100 == 0 {
        return false
    } else if year % 4 == 0 {
        return true
    }
    return false
}

func day(_ year: Int, _ month: Int, _ day: Int) -> Int {
    var ret: Int = 0
    
    
    for i in 0..<year {
        if isLeap(i) {
            ret += 366
        } else {
            ret += 365
        }
    }

    
    for i in 1..<month {
        if i == 2 && isLeap(year) {
            ret += 29
        } else {
            ret += months[i - 1]
        }
    }
    return ret + day
}

if secondDay[0] - firstDay[0] >= 1000 && day(0, firstDay[1], firstDay[2]) <= day(0, secondDay[1], secondDay[2]) {
    print("gg")
} else {
    print("D-\(day(secondDay[0], secondDay[1], secondDay[2]) - day(firstDay[0], firstDay[1], firstDay[2]))")
}
