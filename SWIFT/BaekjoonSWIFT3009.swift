let point1 = readLine()!.split(separator: " ").map {Int($0)!}
let point2 = readLine()!.split(separator: " ").map {Int($0)!}
let point3 = readLine()!.split(separator: " ").map {Int($0)!}
var arrX = [Int]()
var arrY = [Int]()
var counterX = [Int : Int]()
var counterY = [Int : Int]()
var answerX = 0
var answerY = 0

arrX.append(point1[0])
arrX.append(point2[0])
arrX.append(point3[0])

arrY.append(point1[1])
arrY.append(point2[1])
arrY.append(point3[1])

arrX.forEach { counterX[$0, default: 0] += 1 }
arrY.forEach { counterY[$0, default: 0] += 1 }

for i in counterX {
    if i.value % 2 == 1 {
        answerX = i.key
    }
}

for i in counterY {
    if i.value % 2 == 1 {
        answerY = i.key
    }
}

print("\(answerX) \(answerY)")

