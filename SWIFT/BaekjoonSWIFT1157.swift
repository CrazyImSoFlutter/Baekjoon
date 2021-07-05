var str = readLine()!
var arr = Array(repeating: 0, count: 26)

for i in str {
    let a = i
    for j in 0..<26 {
        if a.asciiValue! == 65 + j || a.asciiValue! == 97 + j {
            arr[j] += 1
        }
    }
}

var confirm = false

for i in 0..<26 {
    var a = 0
    for j in 0..<26 {
        if arr[i] > arr[j] {
            a += 1
        }
    }
    if a == 25 {
        print(Character(UnicodeScalar(i + 65)!))
        confirm = true
        break
    }
}
if confirm == false {
    print("?")
}
