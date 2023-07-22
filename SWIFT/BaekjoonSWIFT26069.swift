let N = Int(readLine()!)!
var people = [String : Bool]()
var count = 0

for _ in 0..<N {
    let AB = readLine()!.split(separator: " ").map { String($0) }
    if AB[0] == "ChongChong" {
        people[AB[1]] = true
    } else if AB[1] == "ChongChong" {
        people[AB[0]] = true
    }
    
    if people[AB[0]] == true || people[AB[1]]  == true  {
        people[AB[0]] = true
        people[AB[1]] = true
    } else {
        people[AB[0]] = false
        people[AB[1]] = false
    }
}

people.map {
    if $1 {
        count += 1
    }
}

print(count)
