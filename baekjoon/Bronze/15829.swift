//15829 Hashing
import Foundation

//1
let _ = Int(readLine()!)!
var inputArr = readLine()!.map{Int(Character(String($0)).asciiValue!)-96}
var result = inputArr.enumerated().map{$0.1 * Int(pow(31.0, Double($0.0)))}.reduce(0, +) % 1234567891
print(result)
//2
let _ = Int(readLine()!)!
var inputArr = readLine()!.map{Int(Character(String($0)).asciiValue!)-96}
let M = 1234567891
var r = 1
var result = 0
inputArr.enumerated().forEach { index, num in
    if r > M {
        r %= M
    }
    result += num * r
    r *= 31
}
print(result < 1234567891 ? result : result % 1234567891)
