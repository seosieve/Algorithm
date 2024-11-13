//
//  Algorithms
//
//  Created by 서충원
//

import Foundation

//평범한 배낭
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (count, capacity) = (input[0], input[1])
var weightArr = [Int]()
var valueArr = [Int]()

for _ in 0..<count {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (weight, value) = (input[0], input[1])
    weightArr.append(weight)
    valueArr.append(value)
}

var dp = Array(repeating: Array(repeating: 0, count: capacity+1), count: count+1)

for i in 1...count {
    for j in 1...capacity {
        if weightArr[i-1] > j {
            // 물건을 담을 수 없을 때
            dp[i][j] = dp[i-1][j]
        } else {
            // 물건을 담을 수 있을 때
            dp[i][j] = max(dp[i-1][j], dp[i-1][j - weightArr[i-1]] + valueArr[i-1])
        }
    }
}

print(dp[count][capacity])
