//
//  Algorithms
//
//  Created by 서충원 on 2/15/24.
//

import Foundation

struct Queue<T> {
    private var (inStack, outStack) = ([T](), [T]())
    
    var isEmpty: Bool { inStack.isEmpty && outStack.isEmpty }
    
    mutating func clear() {
        inStack.removeAll()
        outStack.removeAll()
    }
    
    mutating func enqueue(_ value: T) {
        inStack.append(value)
    }
    
    mutating func dequeue() -> T? {
        if outStack.isEmpty {
            outStack = inStack.reversed()
            inStack.removeAll()
        }
        
        return outStack.popLast()
    }
}

let N = Int(readLine()!)!
let direction: [(x: Int, y: Int)] = [(-1,0), (1,0), (0, -1), (0, 1)]
var map = [[String]]()
var visited = Array(repeating: Array(repeating: false, count: N), count: N)
var queue = Queue<(x: Int, y: Int)>()
var color: String = ""
var result = [0,0]

for _ in 0..<N {
    map.append(readLine()!.map{ String($0) })
}

for i in 0..<N {
    for j in 0..<N {
        guard visited[i][j] == false else { continue }
        
        queue.enqueue((i, j))
        color = map[i][j]
        result[0] += 1
        
        while !queue.isEmpty {
            guard let node = queue.dequeue() else { continue }
            
            for (x,y) in direction {
                let next = (x: node.x + x, y: node.y + y)
                
                guard (0..<N) ~= next.x && (0..<N) ~= next.y else { continue }
                guard visited[next.x][next.y] == false else { continue }
                guard map[next.x][next.y] == color else { continue }
                
                queue.enqueue((next.x, next.y))
                visited[next.x][next.y] = true
            }
        }
    }
}

queue.clear()
visited = Array(repeating: Array(repeating: false, count: N), count: N)

for i in 0..<N {
    for j in 0..<N {
        guard visited[i][j] == false else { continue }
        
        queue.enqueue((i, j))
        color = map[i][j]
        result[1] += 1
        
        while !queue.isEmpty {
            guard let node = queue.dequeue() else { continue }
            
            for (x,y) in direction {
                let next = (x: node.x + x, y: node.y + y)
                
                guard (0..<N) ~= next.x && (0..<N) ~= next.y else { continue }
                guard visited[next.x][next.y] == false else { continue }
                
                if color == "B" {
                    guard map[next.x][next.y] == color else { continue }
                } else {
                    guard map[next.x][next.y] == "R" || map[next.x][next.y] == "G" else { continue }
                }
                
                queue.enqueue((next.x, next.y))
                visited[next.x][next.y] = true
            }
        }
    }
}

print(result.map{ String($0) }.joined(separator: " "))
