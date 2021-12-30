// 2805 나무 자르기
import Foundation

let NM = readLine()!.split(separator: " ").map{Int(String($0))!}
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
var min = 0
var max = input.max()!
var output = 0

while min <= max {
    let mid = (min + max) / 2
    let tree = input.map{$0 - mid}.filter{$0 >= 0}.reduce(0, +)
    if tree < NM[1] {
        max = mid-1
    } else {
        output = mid
        min = mid+1
    }
}
print(output)
