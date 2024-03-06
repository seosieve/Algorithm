//
//  Algorithms
//
//  Created by 서충원
//

import Foundation

//15654 N과M(5)
let NM = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N,M) = (NM[0], NM[1])
var map = readLine()!.split(separator: " ").map{Int(String($0))!}
var visited = Array(repeating: false, count: N)
map.sort(by: <)

func recursion(m: Int, result: [Int]) {
    if m == 0 {
        print(result.map{String($0)}.joined(separator: " "))
        return
    }
    for i in 0..<N {
        var newResult = result
        if !visited[i] {
            visited[i] = true
            newResult.append(map[i])
            recursion(m: m-1, result: newResult)
            visited[i] = false
        }
    }
}

recursion(m: M, result: [])
