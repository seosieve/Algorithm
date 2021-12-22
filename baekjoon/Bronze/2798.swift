// 2798 블랙잭
import Foundation

//1
let NM = readLine()!.split(separator: " ").map{Int(String($0))!}
let input = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted(by: <)
var output = 0

for one in 0...NM[0]-3 {
    for two in 1...NM[0]-2 {
        if two <= one { continue }
        for three in 2...NM[0]-1 {
            if three <= two { continue }
            let result = input[one] + input[two] + input[three]
            if result <= NM[1] {
                if result > output {
                    output = result
                }
            } else { break }
        }
    }
}
print(output)

//2
let NM = readLine()!.split(separator: " ").map{Int(String($0))!}
let input = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted(by: <)
var output = 0

for one in 0...NM[0]-3 {
    for two in one+1...NM[0]-2 {
        for three in two+1...NM[0]-1 {
            let sumOfCards = input[one] + input[two] + input[three]
            if sumOfCards <= NM[1] {
                output = max(sumOfCards, output)
            }
        }
    }
}
print(output)
