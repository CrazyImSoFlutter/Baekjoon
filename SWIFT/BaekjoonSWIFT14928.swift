let N = readLine()!
var sum = 0
for i in N { sum = (sum * 10 + Int(String(i))!) % 20000303 }
print(sum)
