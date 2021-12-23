// 1654 랜선 자르기
import Foundation

let KN = readLine()!.split(separator: " ").map{Int(String($0))!}
var lanArr = [Int]()
for _ in 1...KN[0] {
    let input = Int(readLine()!)!
    lanArr.append(input)
}

var min = 1
var max = lanArr.max()!
var output = 0

while min <= max {
    let mid = (min + max) / 2
    var count = 0
    for lan in lanArr {
        count += lan / mid
    }
    if count < KN[1] {
        max = mid-1
    } else if count >= KN[1] {
        min = mid+1
        output = mid
    }
}
print(output)
