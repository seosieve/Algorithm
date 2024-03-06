//
//  Algorithms
//
//  Created by 서충원 on 2/15/24.
//

import Foundation

//1261 알고스팟
let NM = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N,M) = (NM[0], NM[1])
var map = Array(repeating: [Int](), count: M)
var direction = [(-1,0),(1,0),(0,-1),(0,1)]
var distance = Array(repeating: Array(repeating: Int.max, count: N), count: M)

for i in 0..<M {
    let line = readLine()!.map{Int(String($0))!}
    map[i] = line
}

func BFS() {
    var queue = [(0,0)]
    distance[0][0] = 0
    while !queue.isEmpty {
        let node = queue.removeFirst()
        for di in direction {
            let (dx,dy) = (node.0+di.0, node.1+di.1)
            if (0..<M) ~= dx && (0..<N) ~= dy {
                if map[dx][dy] == 1 {
                    distance[dx][dy] = min(distance[dx][dy], distance[node.0][node.1] + 1)
                    queue.append((dx,dy))
                } else if map[dx][dy] == 0 {
                    distance[dx][dy] = min(distance[dx][dy], distance[node.0][node.1])
                    queue.append((dx,dy))
                }
            }
        }
    }
}

BFS()
print(distance[M-1][N-1])
