//7568 덩치
import Foundation

let num = Int(readLine()!)!
var peopleArr = [(Int, Int)]()

for _ in 0..<num {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    peopleArr.append((input[0], input[1]))
}

for index in 0..<num {
    var greater = 1
    for others in 0..<num {
        if peopleArr[index].0 < peopleArr[others].0 && peopleArr[index].1 < peopleArr[others].1 {
            greater += 1
        }
    }
    print(greater)
}
