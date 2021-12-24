// 10871 X보다 작은 수
import Foundation

//1
let pivot = readLine()!.split(separator: " ").map{Int(String($0))!}
let numArr = readLine()!.split(separator: " ").map{Int(String($0))!}.filter{$0 < pivot[1]}

print(numArr.map{String($0)}.joined(separator: " "))

//2
let pivot = readLine()!.split(separator: " ").map{Int(String($0))!}
print(readLine()!.split(separator: " ").map{Int(String($0))!}.filter{$0 < pivot[1]}.map{String($0)}.joined(separator: " "))

