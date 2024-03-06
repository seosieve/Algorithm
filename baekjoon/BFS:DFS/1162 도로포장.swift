//
//  Algorithms
//
//  Created by 서충원 on 2/15/24.
//

import Foundation

//1162 도로포장
struct PriorityQueue<T> {
    //제네릭 타입
    var nodes = [T]()
    let sort:(T,T) -> Bool
    //함수 외부에 저장되거나, 다른 비동기 작업으로 전달되어 호출될 경우
    init(sort: @escaping (T,T) -> Bool) {
        self.sort = sort
    }
    var isEmpty: Bool {
        return nodes.isEmpty
    }
    var count: Int {
        return nodes.count
    }
    func leftChild(of parentIndex: Int) -> Int {
        return parentIndex * 2 + 1
    }
    func rightChild(of parentIndex: Int) -> Int {
        return parentIndex * 2 + 2
    }
    func parentIndex(of childIndex: Int) -> Int {
        return (childIndex - 1) / 2
    }
    
    mutating func shiftDown(from index: Int) {
        var parent = index
        while true {
            let left = leftChild(of: parent)
            let right = rightChild(of: parent)
            var candidate = parent
            if left < count && sort(nodes[left], nodes[candidate]) {
                candidate = left
            }
            if right < count && sort(nodes[right], nodes[candidate]) {
                candidate = right
            }
            if candidate == parent {
                return
            }
            nodes.swapAt(parent, candidate)
            parent = candidate
        }
    }
    
    mutating func shiftUp(from index: Int) {
        var child = index
        var parent = parentIndex(of: child)
        while child > 0 && sort(nodes[child], nodes[parent]) {
            nodes.swapAt(child, parent)
            child = parent
            parent = parentIndex(of: child)
        }
    }
    
    mutating func pop() -> T? {
        guard !isEmpty else { return nil }
        nodes.swapAt(0, count-1)
        defer { shiftDown(from: 0) }
        return nodes.removeLast()
    }
    
    mutating func push(_ element: T) {
        nodes.append(element)
        shiftUp(from: count-1)
    }
}

let INF = Int.max
let NMK = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N,M,K) = (NMK[0], NMK[1], NMK[2])
var map = Array(repeating: [(Int,Int)](), count: N)
var distance = Array(repeating: Array(repeating: INF, count: K+1), count: N)

for _ in 0..<M {
    let line = readLine()!.split(separator: " ").map{Int(String($0))!}
    map[line[0]-1].append((line[1]-1, line[2]))
    map[line[1]-1].append((line[0]-1, line[2]))
}

search()
print(distance[N-1].min()!)

func search() {
    distance[0][0] = 0
    var queue = PriorityQueue<(Int, Int, Int)>(sort: {$0.1 < $1.1})
    queue.push((0,0,0))
    
    while !queue.isEmpty {
        //pop == nil일 때 break
        guard let current = queue.pop() else { break }
        let (currentNode,currentCost,paved) = (current.0,current.1,current.2)
        print(currentNode,paved)
        //이미 distance 최솟값이 currentCost보다 작을 때, 굳이 연산을 할 필요가 없음
        if distance[currentNode][paved] < currentCost { continue }
        
        for branch in map[currentNode] {
            let (nextNode, nextCost) = (branch.0,branch.1)
            //포장하지 않았을 때
            if distance[nextNode][paved] > currentCost + nextCost {
                distance[nextNode][paved] = currentCost + nextCost
                queue.push((nextNode,nextCost + currentCost,paved))
            }
            //포장했을 때
            if paved < K {
                if distance[nextNode][paved+1] > currentCost {
                    distance[nextNode][paved+1] = currentCost
                    queue.push((nextNode,currentCost,paved+1))
                }
            }
        }
    }
}
