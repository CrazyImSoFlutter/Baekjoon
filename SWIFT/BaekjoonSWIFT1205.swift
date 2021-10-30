let NSP = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = NSP[0], S = NSP[1], P = NSP[2]
var A = [Int]()
var answer = 1

if N != 0 {
    A = readLine()!.split(separator: " ").map { Int(String($0))! }
    if N == P && A[N - 1] >= S {
        print(-1)
    } else {
        for i in 0..<N {
            if A[i] > S {
                answer += 1
            }
        }
        print(answer)
    }
} else {
    print(1)
}
