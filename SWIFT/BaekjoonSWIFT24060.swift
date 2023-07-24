var NK = readLine()!.split(separator: " ").map { Int(String($0))! }
var numbers = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = NK[0]
let K = NK[1]
var tmp = Array(repeating: 0, count: N)
var count = 0
var answer = -1


func mergeSort(start: Int, end: Int) {
    if start >= end {
        return
    }
    let middle = (start + end) / 2
    mergeSort(start: start, end: middle)
    mergeSort(start: middle + 1, end: end)
    
    var i = start, j = middle + 1, k = start
    while i <= middle && j <= end {
        if numbers[i] <= numbers[j] {
            tmp[k] = numbers[i]
            k += 1
            i += 1
        } else {
            tmp[k] = numbers[j]
            k += 1
            j += 1
        }
    }
    
    while i <= middle {
        tmp[k] = numbers[i]
        k += 1
        i += 1
    }
    while j <= end {
        tmp[k] = numbers[j]
        k += 1
        j += 1
    }
    
    for i in stride(from: start, to: end + 1, by: 1) {
        numbers[i] = tmp[i]
        count += 1
        if count == K {
            answer = numbers[i]
        }
    }
}

mergeSort(start: 0, end: N - 1)
print(answer)
