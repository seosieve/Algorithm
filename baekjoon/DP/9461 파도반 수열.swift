//
//  Algorithms
//
//  Created by 서충원
//

import Foundation

let T = Int(readLine()!)!
var dp = Array(repeating: 0, count: 101)

dp[1] = 1
dp[2] = 1
dp[3] = 1
dp[4] = 2

for i in 5..<101 {
    dp[i] = dp[i-1] + dp[i-5]
}

for _ in 0..<T {
    let N = Int(readLine()!)!
    print(dp[N])
}
