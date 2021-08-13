let N : Int
if let n = readLine() {
    N = Int(n) ?? 0
}
var balloon = readLine()!.split(separator: " ").enumerated().map{ ($0 ,Int(String($1))!) }
var index = 0
var answer = ""

while true {
    var tmp = balloon[index].1
    answer += "\(balloon[index].0 + 1) "
    if tmp > 0 { tmp -= 1 }
    balloon.remove(at: index)
    index += tmp
    if balloon.count == 0 { break }
    index = (index >= 0) ? index : balloon.count + index % balloon.count
    index %= balloon.count
    
}

print(answer)
