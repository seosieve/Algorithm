//
//  Algorithms
//
//  Created by 서충원 on 2/15/24.
//

import Foundation

//2667 단지번호붙이기
let N = Int(readLine()!)!
var map = Array(repeating: [Int](), count: N)

for i in 0..<N {
    let line = readLine()!.map{Int(String($0))!}
    map[i] = line
}

func find(node: (Int,Int)) -> [(Int,Int)] {
    var result = [(Int,Int)]()
    
    for di in [(-1,0),(1,0),(0,-1),(0,1)] {
        let (dx,dy) = (node.0+di.0, node.1+di.1)
        if (0..<N).contains(dx) && (0..<N).contains(dy) && map[dx][dy] == 1 {
            result.append((dx,dy))
        }
    }
    
    return result
}

func BFS(start: (Int, Int)) -> Int {
    var queue = [start]
    var result = 1
    
    while !queue.isEmpty {
        let node = queue.removeFirst()
        for branch in find(node: node) {
            queue.append(branch)
            map[branch.0][branch.1] = 0
            result += 1
        }
    }
    
    return result
}

var home = [Int]()

for i in 0..<N {
    for j in 0..<N {
        if map[i][j] == 1 {
            map[i][j] = 0
            home.append(BFS(start: (i,j)))
        }
    }
}

print(home.count, home.sorted(by: <).map{String($0)}.joined(separator: "\n"), separator: "\n")
