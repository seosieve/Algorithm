//10816 숫자 카드 2
import Foundation

let _ = Int(readLine()!)!
let inputArr = readLine()!.split(separator: " ").map{Int(String($0))!}
var dict = [Int : Int]()
for input in inputArr {
    if let value = dict[input] {
        dict[input] = value + 1
    } else {
        dict[input] = 1
    }
}
let _ = Int(readLine()!)!
let numArr = readLine()!.split(separator: " ").map{Int(String($0))!}
var outputArr = [String]()
for num in numArr {
    if let count = dict[num] {
        outputArr.append(String(count))
    } else {
        outputArr.append("0")
    }
}

print(outputArr.joined(separator: " "))
