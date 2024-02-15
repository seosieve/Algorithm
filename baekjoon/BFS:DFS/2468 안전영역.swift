//
//  2468 안전영역.swift
//  Algorithms
//
//  Created by 서충원 on 2/15/24.
//

import Foundation

//2468 안전영역
let N = Int(readLine()!)!
var map = Array(repeating: [Int](), count: N)
var maxHeight = 1
var minHeight = 100
var result = 1

for i in 0..<N {
    //입력받으면서 높이 범위 설정
    map[i] = readLine()!.split(separator: " ").map{Int(String($0))!}
    maxHeight = max(maxHeight ,map[i].max()!)
    minHeight = min(minHeight ,map[i].min()!)
}

for i in minHeight..<maxHeight {
    result = max(result ,safeArea(height: i))
}
print(result)

//높이에 따른 안전지대 갯수
func safeArea(height: Int) -> Int {
    var instantMap = map
    var count = 0
    for i in 0..<N {
        for j in 0..<N {
            if instantMap[i][j] > height {
                //잠기지 않는 지역 발견
                instantMap[i][j] = 0
                DFS(start: (i,j), map: &instantMap, height: height)
                count += 1
            }
        }
    }
    return count
}

//붙어있는 지역 탐색 && 지나온 경로 0으로 만들기
func DFS(start: (Int, Int), map: inout [[Int]], height: Int) {
    var queue = [start]
    while !queue.isEmpty {
        let node = queue.removeFirst()
        for di in [(-1,0),(1,0),(0,-1),(0,1)] {
            let (dx,dy) = (node.0+di.0, node.1+di.1)
            //범위 안에 있을 때 && 잠기지 않았을 때
            if (0..<N).contains(dx) && (0..<N).contains(dy) && map[dx][dy] > height {
                queue.append((dx,dy))
                map[dx][dy] = 0
            }
        }
    }
}

//틀린 이유: 모든 부분이 잠기지 않을 때 result 값이 0이 아닌 1이므로 1로 initalize해줘야 한다.
