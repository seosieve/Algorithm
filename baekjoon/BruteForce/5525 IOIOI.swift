//
//  Algorithms
//
//  Created by 서충원
//

import Foundation

let N = Int(readLine()!)!
let M = Int(readLine()!)!
let S = Array(readLine()!)
var i = 0
var count = 0
var output = 0

while i < M-2 {
    if S[i] == "I" && S[i+1] == "O" && S[i+2] == "I" {
        count += 1
        if count >= N { output += 1 }
        i += 2
    } else {
        count = 0
        i += 1
    }
}

print(output)
