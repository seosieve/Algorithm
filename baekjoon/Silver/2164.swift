// 2164 카드2
import Foundation

var inputArr = [Int]()
for index in 1...Int(readLine()!)! {
    inputArr.append(index)
}
var index = 0

while true {
    if inputArr.count == 1 {
        print("1")
        break
    }
    index += 1
    if index == inputArr.count-1 {
        print(inputArr[index])
        break
    }
    inputArr.append(inputArr[index])
    index += 1
}
