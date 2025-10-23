//
//  Algorithms
//
//  Created by 서충원
//

import Foundation

let N = Int(readLine()!)!
var map = [[Int]]()
var output = [0,0]

for _ in 0..<N {
    map.append(readLine()!.split(separator: " ").map{ Int(String($0))! })
}

func divide(min: (x: Int, y: Int), max: (x: Int, y: Int), index: Int) {
    if (max.x - min.x, max.y - min.y) == (1,1) { output[index] += 1; return }
    if isAllSame(min: (min.x, min.y), max: (max.x, max.y)) { output[index] += 1; return }
    let mid = (x: (min.x + max.x) / 2, y: (min.y + max.y) / 2)
    divide(min: (min.x, min.y), max: (mid.x, mid.y), index: map[min.x][min.y])
    divide(min: (mid.x, min.y), max: (max.x, mid.y), index: map[mid.x][min.y])
    divide(min: (min.x, mid.y), max: (mid.x, max.y), index: map[min.x][mid.y])
    divide(min: (mid.x, mid.y), max: (max.x, max.y), index: map[mid.x][mid.y])
}

func isAllSame(min: (x: Int, y: Int), max: (x: Int, y: Int)) -> Bool {
    let flat = (min.x..<max.x).flatMap { i in (min.y..<max.y).map { j in map[i][j] } }
    return Set(flat).count == 1
}

divide(min: (0,0), max: (N, N), index: map[0][0])

print(output.map{ String($0) }.joined(separator: "\n"))
