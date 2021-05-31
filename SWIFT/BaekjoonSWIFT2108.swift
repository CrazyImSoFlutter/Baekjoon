import Foundation

let N = Int(readLine()!)!
var array : [Int] = []
var sum = 0
var count: [Int:Int] = [:]
var mode = 0

for _ in 0..<N {
	let input = Int(readLine()!)!
	sum += input
	count[input] = (count[input] != nil ? count[input]! : 0 ) + 1
	mode = mode < count[input]! ? count[input]! : mode
	array.append(input)
}

array = array.sorted()
let filtered = count.filter{ $0.value == mode }
let countSorted = filtered.sorted{ $0.key < $1.key }

print(Int(round(Double(sum) / Double(N))))
print(array[N / 2])
print(countSorted[countSorted.count > 1 ? 1 : 0].key)
print(array.last! - array.first!)


