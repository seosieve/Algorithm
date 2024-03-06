//
//  Algorithms
//
//  Created by 서충원
//

import Foundation

//15649 N과M(1)
let NM = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N,M) = (NM[0], NM[1])

func recursion(m: Int, result: [Int]) {
    if m == 0 {
        print(result.map{String($0)}.joined(separator: " "))
        return
    }
    for i in 1...N {
        var newResult = result
        if !result.contains(i) {
            newResult.append(i)
            recursion(m: m-1, result: newResult)
        }
    }
}

recursion(m: M, result: [])
