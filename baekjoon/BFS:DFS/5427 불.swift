//
//  Algorithms
//
//  Created by 서충원 on 2/15/24.
//

import Foundation

//5427 불
for _ in 0..<Int(readLine()!)! {
    let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]
    let WH = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (W,H) = (WH[0], WH[1])
    var map = Array(repeating: [String](), count: H)
    var S = (0,0)
    var F = [(Int,Int)]()

    for i in 0..<H {
        let line = readLine()!.map{String($0)}
        map[i] = line
        //시작 위치 탐색
        if let j = line.firstIndex(of: "@") { S = (i,j) }
        //불 위치 탐색
        let fire = line.enumerated().filter{ $0.element == "*" }.map{ (i,$0.offset) }
        F += fire
    }

    func BFS(S: (Int,Int)) {
        var queue = [S]
        var count = 0
        
        while !queue.isEmpty {
            //불 이동
            let instantF = F
            F.removeAll()
            for node in instantF {
                for di in directions {
                    let (dx,dy) = (node.0+di.0, node.1+di.1)
                    if (0..<H) ~= dx && (0..<W) ~= dy {
                        if map[dx][dy] == "." {
                            F.append((dx,dy))
                            map[dx][dy] = "*"
                        }
                    }
                }
            }
            
            //상근이 이동
            let instantQueue = queue
            queue.removeAll()
            count += 1
            for node in instantQueue {
                for di in directions {
                    let (dx,dy) = (node.0+di.0, node.1+di.1)
                    if (0..<H) ~= dx && (0..<W) ~= dy && map[dx][dy] == "." {
                        // 출구에 다다랐을때
                        if dx == 0 || dx == H-1 || dy == 0 || dy == W-1 {
                            print(count+1)
                            return
                        }
                        queue.append((dx,dy))
                        map[dx][dy] = "@"
                    }
                }
            }
        }
        print("IMPOSSIBLE")
    }
    
    if S.0 == 0 || S.0 == H-1 || S.1 == 0 || S.1 == W-1 {
        print(1)
    } else {
        BFS(S: S)
    }
}
