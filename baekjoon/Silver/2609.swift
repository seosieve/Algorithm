// 2609 최대공약수와 최소공배수
import Foundation

//1
var num = readLine()!.split(separator: " ").map{Int(String($0))!}
var GCD = 1

for index in stride(from: num.min()!, through: 2, by: -1) {
    if num[0] % index == 0 && num[1] % index == 0 {
        GCF = index
        break
    }
}
num[0] /= GCD
num[1] /= GCD
LCM = num[0] * num[1] * GCD
print(GCD, LCM, separator: "\n")
//2
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
var num1 = input[0]
var num2 = input[1]

while num2 != 0 {
    let temp = num2
    num2 = num1 % num2
    num1 = temp
}
print(num1, input[0]*input[1]/num1, separator: "\n")
