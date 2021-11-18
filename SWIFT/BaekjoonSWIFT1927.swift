struct heap {
    var heap = Array(repeating: 0, count: 10000001)
    var size = 0

    func getParent(_ index: Int) -> Int {
        return heap[index / 2]
    }

    func getLeftChild(_ index: Int) -> Int {
        return heap[index * 2]
    }

    func getRightChild(_ index: Int) -> Int {
        return heap[index * 2 + 1]
    }
    func isEmpty() -> Bool {
        if size == 0 {
            return true
        }
        return false
    }
    mutating func swap(_ a: Int, _ b: Int) {
        let tmp = heap[a]

        heap[a] = heap[b]
        heap[b] = tmp
    }

    mutating func insert(_ data: Int) {
        size += 1
        var index = size

        while index != 1 && data < getParent(index) {
            heap[index] = getParent(index)
            index /= 2
        }
        heap[index] = data
    }

    mutating func remove() -> Int {
        if isEmpty() {
            return 0
        }
        let result = heap[1]

        swap(1, size)
        size -= 1

        var parent = 1
        var child = parent * 2
        
        if child + 1 <= size {
            child = heap[child] < heap[child + 1] ? child : child + 1
        }
        while child <= size && heap[parent] > heap[child] {
            swap(parent, child)
            parent = child
            child *= 2
            if child + 1 <= size {
                child = heap[child] < heap[child + 1] ? child : child + 1
            }
        }
        return result
    }
}

let N = Int(readLine()!)!
var Q = heap()
var A = ""

for _ in 0..<N {
    let tmp = Int(readLine()!)!

    if tmp == 0 {
        A.append("\(Q.remove())\n")
    } else {
        Q.insert(tmp)
    }
}
print(A)
