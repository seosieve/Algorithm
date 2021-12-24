// 10950 A+B - 3
import Foundation

//1
let num = Int(readLine()!)!
for _ in 1...num {
    let numArr = readLine()!.split(separator: " ").map{Int(String($0))!}
    let sum = numArr[0] + numArr[1]
    print(sum)
}

//2
let num = Int(readLine()!)!
for index in 1...num {
    print(readLine()!.split(separator: " ").map{Int(String($0))!}.reduce(0){$0 + $1})
}

