//
//  Algorithms
//
//  Created by 서충원
//

import Foundation

let N = Int(readLine()!)!
var dp = Array(repeating: 0, count: 12)

dp[1] = 1
dp[2] = 2
dp[3] = 4

for i in 4...11 {
    dp[i] = dp[i-3] + dp[i-2] + dp[i-1]
}

for _ in 0..<N {
    print(dp[Int(readLine()!)!])
}
