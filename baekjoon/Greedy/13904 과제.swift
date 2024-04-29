//
//  Algorithms
//
//  Created by 서충원
//

import Foundation

//13904 과제
struct priorityQueue<T> {
    var nodes = Array<T>()
    let sort:(T,T) -> Bool

    init(sort: @escaping (T,T) -> Bool) {
        self.sort = sort
    }

    var isEmpty: Bool {
        return nodes.isEmpty
    }

    var count: Int {
        return nodes.count
    }

    var top: T {
        return nodes[0]
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
            nodes.swapAt(candidate, parent)
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

let N = Int(readLine()!)!
var taskArr = [(date: Int, score: Int)]()
var pq = priorityQueue<Int>(sort: >)

var today = 0
var result = 0

for _ in 0..<N {
    let task = readLine()!.split(separator: " ").map{Int(String($0))!}
    taskArr.append((task[0], task[1]))
}

taskArr.sort{ $0.0 > $1.0 }
today = taskArr[0].date

while today > 0 {
    for task in taskArr.filter({ $0.date == today }) {
        pq.push(task.score)
    }
    
    today -= 1
    
    if pq.isEmpty { continue }

    result += pq.pop()!
}

print(result)
