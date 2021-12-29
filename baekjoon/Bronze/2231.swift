// 2231 분해합
import Foundation

//1
let scan = readLine()!
let input = Int(scan)!
let inputDigit = scan.map{String($0)}.count
var output = input-(9*inputDigit) > 0 ? input-(9*inputDigit) : 1

while output < input {
    let outputDigitNum = String(output).map{Int(String($0))!}.reduce(0,+)
    if output + outputDigitNum == input {
        break
    }
    output += 1
}
print(output < input ? output : "0")
//2
let scan = readLine()!
let input = Int(scan)!
let inputDigit = String(input).count
var output = input-(9*inputDigit) > 0 ? input-(9*inputDigit) : 1

while output < input {
    var instance = output
    var outputDigitNum = 0
    while instance != 0 {
        outputDigitNum += instance % 10
        instance /= 10
    }
    if output + outputDigitNum == input {
        break
    }
    output += 1
}
print(output < input ? output : "0")
