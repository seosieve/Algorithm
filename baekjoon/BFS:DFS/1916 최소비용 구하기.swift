//
//  Algorithms
//
//  Created by 서충원 on 2/15/24.
//

import Foundation

//1916 최소비용 구하기
let N = Int(readLine()!)!
let M = Int(readLine()!)!

var map = Array(repeating: [(Int,Int)](), count: N)
var distance = Array(repeating: Int.max, count: N)
var visited = Array(repeating: false, count: N)

for _ in 0..<M {
    let line = readLine()!.split(separator: " ").map{Int(String($0))!}
    map[line[0]-1].append((line[1]-1,line[2]))
}

for i in 0..<N {
    map[i].sort{ $0.1 < $1.1 }
}

let SE = readLine()!.split(separator: " ").map{Int(String($0))!-1}
let (S,E) = (SE[0], SE[1])

distance[S] = 0
visited[S] = true

func search(_ current: Int) {
    //current가 visited면 최소거리라는 소리, end
    if current == E { return }
    visited[current] = true
    //distance 최소거리 수정
    for branch in map[current] {
        distance[branch.0] = min(distance[branch.0], distance[current] + branch.1)
    }
    //visited하지 않은 수 중 가장 작은 수 찾기
    let nextArr = distance.enumerated().filter{ !visited[$0.offset] }
    let next = nextArr.min{ $0.element < $1.element }!.offset
    search(next)
}

search(S)
print(distance[E])
