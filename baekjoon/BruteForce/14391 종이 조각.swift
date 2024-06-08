//
//  Algorithms
//
//  Created by 서충원
//

import Foundation

//14391 종이 조각
let NM = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N,M) = (NM[0], NM[1])
var map = [[Int]]()
var result = 0

for _ in 0..<N {
    let line = readLine()!.map{Int(String($0))!}
    map.append(line)
}

for i in 0..<(1 << (N*M)) {
    var sum = 0
    //calculate row
    for row in 0..<N {
        var value = 0
        for col in 0..<M {
            let index = row*M+col
            
            if i & (1 << index) == 0 {
                value = value*10+map[row][col]
            } else {
                sum += value
                value = 0
            }
        }
        sum += value
    }
    //calculate col
    for col in 0..<M {
        var value = 0
        for row in 0..<N {
            let index = row*M+col
            
            if i & (1 << index) != 0 {
                value = value*10+map[row][col]
            } else {
                sum += value
                value = 0
            }
        }
        sum += value
    }
    result = max(result, sum)
}

print(result)
