//
//  Algorithms
//
//  Created by 서충원
//

import Foundation

let N = Int(readLine()!)!
var score = [0]
var dp = Array(repeating: 0, count: N+1)

for _ in 0..<N {
    score.append(Int(readLine()!)!)
}

if N == 1 { print(score[1]); exit(0) }
if N == 2 { print(score[1] + score[2]); exit(0) }

dp[1] = dp[0] + score[1]
dp[2] = dp[1] + score[2]

for i in 3..<N+1 {
    let compare1 = dp[i-2] + score[i]
    let compare2 = dp[i-3] + score[i-1] + score[i]
    dp[i] = max(compare1, compare2)
}

print(dp[N])
