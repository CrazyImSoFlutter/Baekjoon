import Foundation

var N : Int = 0

while true {
    N = Int(readLine()!)!
    if N == -1 {
        break
    }
    var answerArray = [Int]()
    var sum : Int = 0
    for i in 1...Int(sqrt(Double(N))) {
        if N % i == 0 {
            answerArray.append(i)
            sum += i
            if i != N / i {
                answerArray.append(N / i)
                sum += (N / i)
            }
        }
    }
    sum -= N
    if sum == N {
        let sortedArray = answerArray.sorted(by: <)
        var answer = "\(N) = "
        for i in sortedArray {
            if i == sortedArray[sortedArray.count - 2] {
                answer += "\(i)"
                break
            } else {
                answer += "\(i) + "
            }
        }
        print(answer)
    } else {
        print("\(N) is NOT perfect.")
    }
}
