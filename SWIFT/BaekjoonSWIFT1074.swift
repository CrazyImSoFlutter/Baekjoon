import Foundation

let Nrc = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = Nrc[0], r = Nrc[1], c = Nrc[2]
var answer = 0

func find(_ minY: Int,_ minX: Int, _ maxY: Int, _ maxX: Int) {
    if (r >= minY && r <= minY + (maxY - minY - 1) / 2) && (c >= minX && c <= minX + (maxX - minX - 1) / 2) {
        if maxY - minY == 2 {
            return
        } else {
            find(minY, minX, minY + (maxY - minY) / 2, minX + (maxX - minX) / 2)
        }
    } else if (r >= minY && r <= minY + (maxY - minY - 1) / 2) && (c >= minX + (maxX - minX) / 2 && c <= maxX - 1) {
        if maxY - minY == 2 {
            answer += 1
            return
        } else {
            answer += (maxY - minY) * (maxY - minY) / 4
            find(minY, minX + (maxX - minX) / 2, minY + (maxY - minY) / 2, maxX)
        }
    } else if (r >= minY + (maxY - minY) / 2 && r <= maxY - 1) && (c >= minX && c <= minX + (maxX - minX - 1) / 2) {
        if maxY - minY == 2 {
            answer += 2
            return
        } else {
            answer += (maxY - minY) * (maxY - minY) * 2 / 4
            find(minY + (maxY - minY) / 2, minX, maxY, minX + (maxX - minX) / 2)
        }
    } else if (r >= minY + (maxY - minY) / 2 && r <= maxY - 1) && (c >= minX + (maxX - minX) / 2 && c <= maxX - 1) {
        if maxY - minY == 2 {
            answer += 3
            return
        } else {
            answer += (maxY - minY) * (maxY - minY) * 3 / 4
            find(minY + (maxY - minY) / 2, minX + (maxX - minX) / 2, maxY, maxX)
        }
    }
}

find(0, 0, Int(pow(Double(2), Double(N))), Int(pow(Double(2), Double(N))))
print(answer)
