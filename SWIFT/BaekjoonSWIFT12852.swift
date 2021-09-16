var N = Int(readLine()!)!
var before =  Array(repeating: 0, count: 1000001)
var data = Array(repeating: 0, count: 1000001)
var answer = ""

func makeOne(_ num: Int) -> Int {
    data[1] = 0
    for i in 2...N {
        data[i] = data[i - 1] + 1
        before[i] = i - 1
        if i % 3 == 0 {
            if data[i] > data[i / 3] + 1 {
                data[i] = data[i / 3] + 1
                before[i] = i / 3
            }
        }
        
        if i % 2 == 0 {
            if data[i] > data[i / 2] + 1 {
                data[i] = data[i / 2] + 1
                before[i] = i / 2
            }
        }
    }
    return data[N]
}

if N == 1 {
    print(0)
    print(1)
} else {
    print(makeOne(N))
    while true {
        answer += "\(N) "
        N = before[N]
        if N == 0 {
            break
        }
    }
    print(answer)
}

