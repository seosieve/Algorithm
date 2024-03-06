//
//  Algorithms
//
//  Created by 서충원 on 2/15/24.
//

import Foundation

//6593 상범 빌딩
while true {
    //층수, 행, 열
    let LRC = readLine()!.split(separator: " ").map{Int(String($0))!}
    if LRC == [0,0,0] { break }
    let (L,R,C) = (LRC[0],LRC[1],LRC[2])
    var (S,E) = ((0,0,0),(0,0,0))
    var building = Array(repeating: Array(repeating: [String](), count: R), count: L)

    for floor in 0..<L {
        for line in 0..<R {
            let input = readLine()!.map{String($0)}
            building[floor][line] = input
            for (index, block) in input.enumerated() {
                switch block {
                case "S":
                    S = (floor,line,index)
                case "E":
                    E = (floor,line,index)
                default:
                    break
                }
            }
        }
        let _ = readLine()!
    }
    
    BFS(start: S)

    func BFS(start: (Int,Int,Int)) {
        var queue = [start]
        var depthArr = [1]
        while !queue.isEmpty {
            let node = queue.removeFirst()
            let depth = depthArr.removeFirst()
            for branch in find(node: node) {
                queue.append(branch)
                depthArr.append(depth+1)
                building[branch.0][branch.1][branch.2] = "#"
                if branch == E {
                    print("Escaped in \(depth) minute(s).")
                    return
                }
            }
        }
        print("Trapped!")
    }

    func find(node: (Int,Int,Int)) -> [(Int,Int,Int)] {
        var result = [(Int,Int,Int)]()
        for di in [(-1,0,0),(1,0,0),(0,-1,0),(0,1,0),(0,0,-1),(0,0,1)] {
            let (dz,dy,dx) = (node.0+di.0,node.1+di.1,node.2+di.2)
            if (0..<L).contains(dz) && (0..<R).contains(dy) && (0..<C).contains(dx) {
                if building[dz][dy][dx] == "." || building[dz][dy][dx] == "E" {
                    result.append((dz,dy,dx))
                }
            }
        }
        return result
    }
}
