// 10818 최소 최대
import Foundation

// 1
let intNum = Int(readLine()!)!
let intArr = readLine()!.split(separator: " ").map{Int(String($0))!}

var minimum = intArr[0]
var maximum = intArr[0]

for index in 1...intNum {
    if intArr[index-1] < minimum {
        minimum = intArr[index-1]
    }
    if intArr[index-1] > maximum {
        maximum = intArr[index-1]
    }
}

print(minimum, maximum, separator: " ")

//2 간결하게
let intNum = Int(readLine()!)!
let intArr = readLine()!.split(separator: " ").map{Int(String($0))!}

print(intArr.min(), intArr.max(), separator: " ")

