let N = Int(readLine()!)!
var num = Set<Int>()
let arr = readLine()!.split(separator:" ").map {Int(String($0))!}
for i in 1...N {
    num.insert(arr[i - 1])
}
let sortedNum = num.sorted(by: <)

func binarySearch<T: Comparable>(array: [T], key: T) -> Int? {
  var lowerBound = 0
  var upperBound = array.count
  
  while lowerBound < upperBound {
    let midIndex = lowerBound + (upperBound - lowerBound) / 2

    if array[midIndex] == key {
      return midIndex
    } else if array[midIndex] < key {
      lowerBound = midIndex + 1
    } else {
      upperBound = midIndex
    }
  } 
  return nil
}

for i in arr {
    print("\(binarySearch(array: sortedNum, key: i)!) ", terminator:"")
}
