let tune = readLine()!.split(separator: " ").map { Int(String($0))! }
let ascending = [1, 2, 3, 4, 5, 6, 7, 8]
let descending = [8, 7, 6, 5, 4, 3, 2, 1]

if tune == ascending {
    print("ascending")
} else if tune == descending {
    print("descending")
} else {
    print("mixed")
}
