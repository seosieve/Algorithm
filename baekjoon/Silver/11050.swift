//11050 이항 계수 1
import Foundation
//1
let NK = readLine()!.split(separator: " ").map{Int(String($0))!}

func factorial(_ n: Int) -> Int {
    if n == 0 { return 1 }
    return n * factorial(n-1)
}
print(factorial(NK[0])/(factorial(NK[1]) * factorial(NK[0]-NK[1])))
//2
let NK = readLine()!.split(separator: " ").map{Int(String($0))!}

func factorial(_ n: Int) -> Int {
    return n == 0 ? 1 : Array(1...n).reduce(1,*)
}
print(factorial(NK[0])/(factorial(NK[1]) * factorial(NK[0]-NK[1])))
