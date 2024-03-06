//
//  Algorithms
//
//  Created by 서충원 on 2/15/24.
//

import Foundation

//3055 탈출
let RC = readLine()!.split(separator: " ").map{Int(String($0))!}
let (R,C) = (RC[0], RC[1])
var S = (0,0)
var D = (0,0)
var W = [(Int,Int)]()
var map = Array(repeating: [String](), count: R)
var direction = [(-1,0),(1,0),(0,-1),(0,1)]

//입력값 받기
for i in 0..<R {
    let line = readLine()!.map{String($0)}
    map[i] = line
    
    if let s = line.firstIndex(of: "S") { S = (i,s) }
    if let d = line.firstIndex(of: "D") { D = (i,d) }
    let w = line.enumerated().filter{ $0.element == "*" }.map{ (i,$0.offset) }
    W += w
}

func BFS() {
    var queue = [S]
    var count = 0
    while !queue.isEmpty {
        count += 1
        water()
        if hedgeHog(queue: &queue) {
            print(count)
            return
        }
    }
    print("KAKTUS")
}

func water() {
    let queue = W
    W.removeAll()
    for node in queue {
        for di in direction {
            let (dx,dy) = (node.0+di.0, node.1+di.1)
            if (0..<R) ~= dx && (0..<C) ~= dy {
                if map[dx][dy] == "." || map[dx][dy] == "S" {
                    W.append((dx,dy))
                    map[dx][dy] = "*"
                }
            }
        }
    }
}

func hedgeHog(queue: inout [(Int,Int)]) -> Bool {
    let instantQueue = queue
    var isEscaped = false
    queue.removeAll()
    for node in instantQueue {
        for di in direction {
            let (dx,dy) = (node.0+di.0, node.1+di.1)
            if (0..<R) ~= dx && (0..<C) ~= dy {
                if map[dx][dy] == "." {
                    queue.append((dx,dy))
                    map[dx][dy] = "S"
                } else if (dx,dy) == D {
                    isEscaped = true
                }
            }
        }
    }
    return isEscaped
}

BFS()
