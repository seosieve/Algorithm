//
//  11724 연결 요소의 개수.swift
//  Algorithms
//
//  Created by 서충원 on 2/15/24.
//

import Foundation

//11724 연결 요소의 개수
let NM = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N,M) = (NM[0], NM[1])
var map = Array(repeating: [Int](), count: N+1)
var queue = [Int]()
var visited = [Int]()
var result = 0

//map 생성
for _ in 0..<M {
    let line = readLine()!.split(separator: " ").map{Int(String($0))!}
    map[line[0]].append(line[1])
    map[line[1]].append(line[0])
}

//방문한적 없는 숫자일때 시작점으로 하나씩 추가
for i in 1...N {
    if !visited.contains(i) {
        connected(start: i)
        result += 1
    }
}
print(result)

//연결된 노드 확인하고 visited 추가
func connected(start: Int) {
    queue.append(start)
    visited.append(start)
    while !queue.isEmpty {
        let node = queue.removeFirst()
        for branch in map[node] {
            if !visited.contains(branch) {
                queue.append(branch)
                visited.append(branch)
            }
        }
    }
}
