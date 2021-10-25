import Foundation

let DHW = readLine()!.split(separator: " ").map { Int(String($0))! }
let D = DHW[0], H = DHW[1], W = DHW[2]

let DD = Int(pow(Double(D), 2))
let HH = Int(pow(Double(H), 2))
let WW = Int(pow(Double(W), 2))
let AH = Int(sqrt(Double(DD) / Double(HH + WW)) * Double(H))
let AW = Int(sqrt(Double(DD) / Double(HH + WW)) * Double(W))

print(AH, AW)
