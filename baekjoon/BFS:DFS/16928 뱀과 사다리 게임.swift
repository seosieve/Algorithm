//
//  Algorithms
//
//  Created by 서충원 on 2/15/24.
//

import Foundation

struct Queue<T> {
    private var (inStack, outStack) = ([T](), [T]())
    
    var isEmpty: Bool { instack.isEmpty && outstack.isEmpty }
    
    mutating func enqueue(_ element: T) {
        instack.append(element)
    }
    
    mutating func dequeue() -> T? {
        if outstack.isEmpty {
            outstack = instack.reversed()
            instack.removeAll()
        }
        
        return outstack.popLast()
    }
}

let MN = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (M,N) = (MN[0], MN[1])
var stair = [Int: Int]()
var snake = [Int: Int]()
var map = Array(repeating: 0, count: 101)
var visited = Array(repeating: false, count: 101)
var queue = Queue<(index: Int, count: Int)>()

for _ in 0..<M {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    stair[input[0]] = input[1]
}

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    snake[input[0]] = input[1]
}

queue.enqueue((1,1))
visited[0] = true
visited[1] = true

while !queue.isEmpty {
    guard let node = queue.dequeue() else { continue }
    
    for dice in 1...6 {
        let next = node.index + dice
        guard (0..<101) ~= next else { continue }
        guard !visited[next] else { continue }
        
        let destination = stair[next] ?? snake[next] ?? next
        
        map[destination] = node.count
        queue.enqueue((destination, node.count + 1))
        visited[next] = true
        visited[destination] = true
    }
}

print(map[100])
