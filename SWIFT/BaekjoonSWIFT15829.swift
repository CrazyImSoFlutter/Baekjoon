import Foundation

let L = Int(readLine()!)!
let str = readLine()!
let M : UInt64 = 1234567891
var hash : UInt64 = 0
var index = 0
var power : UInt64 = 1

for i in str {
    hash = (hash + (UInt64(i.asciiValue!) - 96) * power) % M
    power = (power * 31) % M
}

print(hash)
