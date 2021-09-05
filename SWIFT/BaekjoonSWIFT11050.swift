let NK = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = NK[0], K = NK[1]

func facto(_ num: Int) -> Int {
    var ret = 1
    
    if num == 0 {
        return 1
    }
    for i in 1...num {
        ret *= i
    }
    return ret
}

print(facto(N) / (facto(K) * facto(N - K)))
