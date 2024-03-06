//
//  Algorithms
//
//  Created by 서충원 on 2/15/24.
//

import Foundation

//11403 경로찾기
let N = Int(readLine()!)!
var map = Array(repeating: [Int](), count: N)

for i in 0..<N {
    let line = readLine()!.split(separator: " ").map{Int(String($0))!}.enumerated()
    map[i] = line.filter{ $0.element == 1 }.map { $0.offset }
}

func BFS(start: Int, end: Int) -> Int {
    var queue = [start]
    var visited = [start]
    
    while !queue.isEmpty {
        let node = queue.removeFirst()
        for branch in map[node] {
            if branch == end { return 1 }
            if !visited.contains(branch) {
                queue.append(branch)
                visited.append(branch)
            }
        }
    }
    return 0
}

for i in 0..<N {
    for j in 0..<N {
        print(BFS(start: i, end: j), terminator: " ")
    }
    print()
}
