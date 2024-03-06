//
//  Algorithms
//
//  Created by 서충원
//

import Foundation

//1780 종이의 개수
let N = Int(readLine()!)!
var map = Array(repeating: [Int](), count: N)
var result = [0,0,0]

for i in 0..<N {
    let line = readLine()!.split(separator: " ").map{Int(String($0))!}
    map[i] = line
}

func check(x: Int, y: Int, n: Int) -> Bool {
    for i in x..<x+n {
        for j in y..<y+n {
            if map[i][j] != map[x][y] {
                return false
            }
        }
    }
    return true
}

func recursion(x: Int, y: Int, n: Int) {
    if check(x: x, y: y, n: n) {
        switch map[x][y] {
        case -1:
            result[0] += 1
        case 0:
            result[1] += 1
        default:
            result[2] += 1
        }
        return
    } else {
        for i in 0..<3 {
            for j in 0..<3 {
                recursion(x: x+i*n/3, y: y+j*n/3, n: n/3)
            }
        }
    }
}

recursion(x: 0, y: 0, n: N)
print(result.map{String($0)}.joined(separator: "\n"))
