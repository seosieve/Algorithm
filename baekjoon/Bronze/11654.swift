// 11720 숫자의 합
import Foundation

let _ = Int(readLine()!)!
print(readLine()!.map{Int(String($0))!}.reduce(0,+))
