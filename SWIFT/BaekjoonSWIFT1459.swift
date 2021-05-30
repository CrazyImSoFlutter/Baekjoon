let nums = readLine()!.split(separator: " ").map { Int($0)! }
let x = nums[0]
let y = nums[1]
let w = nums[2]
let s = nums[3]
let ans1 ,ans2, ans3: Int
let minimum = min(x, y)
let maximum = max(x, y) 

ans1 = (minimum + maximum) * w
ans2 = minimum * s + (maximum - minimum) * w
if (maximum - minimum) % 2 == 0 {
    ans3 = maximum * s
} else {
    ans3 = (maximum - 1) * s + w
}

let realAns = min(ans1, ans2, ans3)
print(realAns)
