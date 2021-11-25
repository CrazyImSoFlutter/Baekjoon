let LR = readLine()!.split(separator: " ").map { String($0) }
let L = LR[0], R = LR[1]

var LArray = L.map { String($0) }
var RArray = R.map { String($0) }

if LArray.count != RArray.count {
    print(0)
} else {
    var count = 0

    for i in 0..<LArray.count {
        if LArray[i] == RArray[i] && LArray[i] == "8" {
            count += 1
        } else if LArray[i] != RArray[i] {
            break
        }
    }
    print(count)
}
