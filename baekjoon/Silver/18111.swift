//11811 마인크래프트
import Foundation

let NMB = readLine()!.split(separator: " ").map{Int(String($0))!}
var groundArr = [Int]()
for _ in 0..<NMB[0] {
    let ground = readLine()!.split(separator: " ").map{Int(String($0))!}
    groundArr += ground
}

let min = groundArr.min()!
let max = groundArr.max()!
var bestTime = Int.max
var bestHeight = Int.max

for height in min...max {
    var time = 0
    var B = NMB[2]
    for index in groundArr {
        if index < height {
            let gap = height - index
            time += gap
            B -= gap
        } else {
            let gap = index - height
            time += (gap * 2)
            B += gap
        }
    }
    if B < 0 {
        break
    } else {
        if time < bestTime {
            bestTime = time
            bestHeight = height
        } else if time == bestTime {
            if height > bestHeight {
                bestTime = time
                bestHeight = height
            }
        }
    }
}
print("\(bestTime) \(bestHeight)")
