var coreCourseCredit : Double = 0.0
var totalCredit : Double = 0.0

for _ in 0..<20 {
    let subject = readLine()!.split(separator: " ").map{ String($0) }
    let credit = Double(subject[1])!
    let grade = subject[2]
    
    switch grade {
    case "A+" :
        coreCourseCredit += 4.5 * credit
        totalCredit += credit
    case "A0" :
        coreCourseCredit += 4.0 * credit
        totalCredit += credit
    case "B+" :
        coreCourseCredit += 3.5 * credit
        totalCredit += credit
    case "B0" :
        coreCourseCredit += 3.0 * credit
        totalCredit += credit
    case "C+" :
        coreCourseCredit += 2.5 * credit
        totalCredit += credit
    case "C0" :
        coreCourseCredit += 2.0 * credit
        totalCredit += credit
    case "D+" :
        coreCourseCredit += 1.5 * credit
        totalCredit += credit
    case "D0" :
        coreCourseCredit += 1.0 * credit
        totalCredit += credit
    case "F" :
        coreCourseCredit += 0 * credit
        totalCredit += credit
    default :
        coreCourseCredit += 0
    }
}

print(coreCourseCredit / totalCredit)
