// 10869 사칙연산
import Foundation

let numArr = readLine()!.split(separator: " ").map{Int(String($0))!}
let sum = numArr[0] + numArr[1]
let min = numArr[0] - numArr[1]
let dup = numArr[0] * numArr[1]
let div = numArr[0] / numArr[1]
let rem = numArr[0] % numArr[1]

print(sum, min, dup, div, rem, separator: "\n")
