//
//  Algorithms
//
//  Created by 서충원
//

import Foundation

//14500 테트로미노
let NM = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, M) = (NM[0], NM[1])
var map = [[Int]]()
var visited = Array(repeating: Array(repeating: false, count: M), count: N)
var direction = [(-1,0),(1,0),(0,-1),(0,1)]
var maxValue = -1

for _ in 0..<N {
    let line = readLine()!.split(separator: " ").map{Int(String($0))!}
    map.append(line)
}

for i in 0..<N {
    for j in 0..<M {
        //보라색 제외
        visited[i][j] = true
        make(start: (i,j), count: 1, value: map[i][j])
        visited[i][j] = false
        //보라색
        if i == 0 || i == N || j == 0 || j == M {
            if (i,j) != (0,0) && (i,j) != (N,M) {
                makePurpleCorner(start: (i,j))
            }
        } else {
            makePurple(start: (i,j))
        }
    }
}

print(maxValue)

func make(start: (Int,Int), count: Int, value: Int) {
    if count == 4 {
        maxValue = max(maxValue, value)
        return
    }
    
    for di in direction {
        let next = (start.0 + di.0, start.1 + di.1)
        if (0..<N) ~= next.0 && (0..<M) ~= next.1 && !visited[next.0][next.1] {
            visited[next.0][next.1] = true
            make(start: next, count: count+1, value: value + map[next.0][next.1])
            visited[next.0][next.1] = false
        }
    }
}

func makePurpleCorner(start: (Int,Int)) {
    var value = map[start.0][start.1]
    
    for di in direction {
        let next = (start.0 + di.0, start.1 + di.1)
        if (0..<N) ~= next.0 && (0..<M) ~= next.1 {
            value += map[next.0][next.1]
        }
    }
    maxValue = max(maxValue, value)
}

func makePurple(start: (Int,Int)) {
    var value = map[start.0][start.1]
    var minValue = 1001
    
    for di in direction {
        let next = (start.0 + di.0, start.1 + di.1)
        if (0..<N) ~= next.0 && (0..<M) ~= next.1 {
            minValue = min(minValue, map[next.0][next.1])
            value += map[next.0][next.1]
        }
    }
    
    value -= minValue
    maxValue = max(maxValue, value)
}
