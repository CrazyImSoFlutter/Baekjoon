let T = Int(readLine()!)!
var minX: Int = 0
var minY: Int = 0
var maxX: Int = 0
var maxY: Int = 0

for i in 0..<T {
    let XY = readLine()!.split(separator: " ").map { Int(String($0))! }
    let X = XY[0]
    let Y = XY[1]
    
    if i == 0 {
        minX = X; maxX = X
        minY = Y; maxY = Y
        continue
    }
    
    minX = minX > X ? X : minX
    minY = minY > Y ? Y : minY
    maxX = maxX < X ? X : maxX
    maxY = maxY < Y ? Y : maxY
}

print((maxX - minX) * (maxY - minY))
