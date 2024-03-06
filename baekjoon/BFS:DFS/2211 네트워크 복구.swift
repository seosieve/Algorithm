//
//  Algorithms
//
//  Created by 서충원 on 2/15/24.
//

import Foundation

//2211 네트워크 복구
let NM = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N,M) = (NM[0],NM[1])
var map = Array(repeating: [(Int,Int)](), count: N)
var distance = Array(repeating: Int.max, count: N)
var visited = Array(repeating: false, count: N)
var result = Array(repeating: -1, count: N)
distance[0] = 0

for _ in 0..<M {
    let line = readLine()!.split(separator: " ").map{Int(String($0))!}
    map[line[0]-1].append((line[1]-1, line[2]))
    map[line[1]-1].append((line[0]-1, line[2]))
}

func search(_ current: Int) {
    //방문처리
    visited[current] = true
    //전체 탐색 되면 return
    if !visited.contains(false) { return }
    //경로 탐색 후 초기화
    for branch in map[current] {
        let next = branch.0
        let cost = branch.1
        
        if distance[next] > distance[current]+cost {
            distance[next] = distance[current]+cost
            result[next] = current
        }
    }
    //다음 노드 구하기
    let nextArr = distance.enumerated().filter{ visited[$0.offset] == false }
    let next = nextArr.min{ $0.element < $1.element }!.offset
    search(next)
}

search(0)

print(N-1)
result.enumerated()
    .filter{ $0.element != -1 }
    .forEach { print($0.offset+1, $0.element+1) }
