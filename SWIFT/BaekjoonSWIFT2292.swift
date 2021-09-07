let N = Int(readLine()!)!
var count = 1
var room = 0

while true {
    room = count * count * 3 - count * 3 + 1
    if room >= N {
        print(count)
        break
    }
    count += 1
}
