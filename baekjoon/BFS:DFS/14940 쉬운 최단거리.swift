//
//  Algorithms
//
//  Created by 서충원 on 2/15/24.
//

import Foundation

let NM = readLine()!.split(separator: " ").map{ Int(String($0))! }
var direction = [(-1, 0), (1, 0), (0, -1), (0, 1)]
let (N, M) = (NM[0], NM[1])
var (n, m) = (0, 0)
var map = [[Int]]()
var visited = Array(repeating: Array(repeating: false, count: M), count: N)
var queue = [(Int, Int, Int)]()
var index = 0

for instantN in 0..<N {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    map.append(input)
    guard let instantM = input.firstIndex(of: 2) else { continue }
    (n, m) = (instantN, instantM)
    queue = [(n, m, 0)]
}

while index < queue.count {
    let node: (x: Int, y: Int, count: Int) = queue[index]
    index += 1
    
    guard (0..<N) ~= node.x && (0..<M) ~= node.y else { continue }
    guard visited[node.x][node.y] == false && map[node.x][node.y] != 0 else { continue }
    map[node.x][node.y] = node.count
    visited[node.x][node.y] = true
    
    for dr in direction {
        queue.append((node.0 + dr.0, node.1 + dr.1, node.count + 1))
    }
}

for i in 0..<N {
    for j in 0..<M {
        if visited[i][j] == false && map[i][j] != 0 {
            map[i][j] = -1
        }
    }
}

for line in map {
    print(line.map{ String($0) }.joined(separator: " "))
}
