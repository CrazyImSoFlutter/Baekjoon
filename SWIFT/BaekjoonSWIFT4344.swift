import Foundation

var N = Int(readLine()!)!

for _ in 0..<N {
    var arr = readLine()!.split(separator: " ").map { Int(String($0))! }
    var avg = Double(arr.reduce(0, +) - arr[0]) / Double(arr.count - 1)
    var count = 0
    for i in 1...arr[0] {
        if Double(arr[i]) > avg {
            count += 1
        }
    }
    var answer = String(round(Double(count) / Double(arr.count - 1) * 100 * 1000) / 1000)
    
    if answer.count == 3 || answer.count == 4 {
        print(answer + "00%")
    } else if answer.count == 5 {
        print(answer + "0%")
    } else if answer.count == 6{
        print(answer + "%")
    }
}
