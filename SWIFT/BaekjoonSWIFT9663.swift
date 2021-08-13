let n = Int(readLine()!)!

var lt: [Bool] = Array(repeating: true, count: n)
var rt: [Bool] = Array(repeating: true, count: n)
var benList: [Bool] = Array(repeating: false, count: n)
var result = 0
dfs(lt,rt,benList,-3, 0, &result)

print(result)

func dfs(_ tlt: [Bool],_ trt: [Bool], _ benList: [Bool], _ bfIdx: Int, _ depth: Int, _ result: inout Int) {
    if depth == n {
        result += 1
        return
    }

    for i in 0 ..< n {
        if benList[i] || i == bfIdx - 1 || i == bfIdx + 1 {
            continue
        } else {
            if tlt[i] && trt[i] {
                var lt = tlt
                var rt = trt
                var vBenList = benList
                vBenList[i] = true

                lt[i] = false
                rt[i] = false

                lt.removeFirst()
                lt.append(true)
                rt.removeLast()
                rt.insert(true, at: 0)

                dfs(lt, rt, vBenList, i, depth+1, &result)
            }
        }
    }
}
