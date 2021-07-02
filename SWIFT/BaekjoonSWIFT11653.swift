let N = Int(readLine()!)!
var count = 0

func find(_ N: Int) {
    if N == 1 , count == 0 {
        print("")
        return
    } else if N == 1, count != 0 {
        return
    }
    count += 1
    for i in 2...N {
        if N % i == 0 {
            print(i)
            find(N / i)
            return
        } else {
            continue
        }
    }
}

find(N)
