import Foundation

let XSYS = readLine()!.split(separator: " ").map { Int(String($0))! }
let XS = XSYS[0], YS = XSYS[1]
let XY = readLine()!.split(separator: " ").map { Int(String($0))! }
let XE = XY[0], YE = XY[1]
var DX = XY[2], DY = XY[3]
var dist: Double = 0
var near = (0, 0)

func getDist(_ x: Int, _ y: Int) -> Double {
    return pow(Double(x - XS), 2) + pow(Double(y - YS), 2)
}

func find() {
    var x = XE, y = YE

    while (true) {
        x += DX
        y += DY

        let tmp = getDist(x, y)
        if tmp > dist {
            break
        } else {
            dist = tmp
            near = (x, y)
        }
    }
}

func changeD() {
    var MIN = min(DX, DY)

    if MIN == 0 {
        if DX == 0 {
            DY = 1
        } else {
            DX = 1
        }
        return
    }

    while (MIN != 0) {
        if DX % MIN == 0 && DY % MIN == 0 {
            break
        } else {
            MIN -= 1
        }
    }

    if MIN > 1 {
        DX /= MIN
        DY /= MIN
    }
}

dist = getDist(XE, YE)
near = (XE, YE)

changeD()
if DX != 0 || DY != 0 {
    find()
}

print(near.0, near.1)
