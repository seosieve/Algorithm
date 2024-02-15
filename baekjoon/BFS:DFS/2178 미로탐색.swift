//
//  2178 미로탐색.swift
//  Algorithms
//
//  Created by 서충원 on 2/15/24.
//

import Foundation

//2178 미로탐색
let NM = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N,M) = (NM[0], NM[1])
var map = Array(repeating: Array(repeating: 0, count: M), count: N)
var visited = map
visited[0][0] = 1
var queue = [(0,0)]

//map 생성
for i in 0..<N {
    let line = readLine()!.map{Int(String($0))!}
    map[i] = line
}

print(BFS())

//갈 수 있는 경우의 수
func location(current: (Int, Int)) -> [(Int, Int)] {
    var output = [(Int, Int)]()
    //상하좌우 나아갈 수 있는 경우의 수
    for di in [(-1,0), (1,0), (0,-1), (0,1)] {
        let (dx,dy) = (current.0+di.0, current.1+di.1)
        if (0..<N).contains(dx) && (0..<M).contains(dy) {
            //갈 수 있는 곳인지 && 방문하지 않았던 곳인지 확인
            if map[dx][dy] == 1 && visited[dx][dy] == 0 {
                output.append((dx,dy))
                visited[dx][dy] = 1
                //visited 즉시 표시해주어야함!
                //즉시 표시 안해주면 queue에 여러번 들어가서 연산시간 상승
            }
        }
    }
    return output
}

//BFS
func BFS() -> Int {
    var count = 1
    //queue.removeAll을 해서 현재 몇 단계째의 BFS인지 계산
    while !queue.contains(where: {$0 == (N-1,M-1)}) {
        let queueInstance = queue
        queue.removeAll()
        for node in queueInstance {
            queue += location(current: node)
        }
        count += 1
    }
    
    return count
}

//틀린이유: visited표시를 queue에 넣은 후가 아닌 queue에서 제거될 때 해주어서 시간초과
