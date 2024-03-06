//
//  Algorithms
//
//  Created by 서충원 on 2/15/24.
//

import Foundation

//1260 DFS와 BFS
let NMV = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N,M,V) = (NMV[0], NMV[1], NMV[2])
var map = Array(repeating: [Int](), count: N+1)

//map 만들기
for _ in 0..<M {
    let line = readLine()!.split(separator: " ").map{Int(String($0))!}
    map[line[0]].append(line[1])
    map[line[1]].append(line[0])
}

//DFS Recursion
func DFSByRecursion() {
    let sortedMap = map.map{$0.sorted(by: <)}
    var visited = [Int]()
    recursion(node: V, map: sortedMap, visited: &visited)
    print(visited.map{String($0)}.joined(separator: " "))
}

func recursion(node: Int, map: [[Int]], visited: inout [Int]) {
    visited.append(node)
    for branch in map[node] {
        if !visited.contains(branch) {
            recursion(node: branch, map: map, visited: &visited)
        }
    }
}

//DFS Stack
func DFSByStack() {
    let sortedMap = map.map{$0.sorted(by: >)}
    var stack = [V]
    var visited = [Int]()
    
    while !stack.isEmpty {
        let node = stack.removeLast()
        if !visited.contains(node) {
            visited.append(node)
            for branch in sortedMap[node] {
                stack.append(branch)
            }
        }
    }
    print(visited.map{String($0)}.joined(separator: " "))
}

//BFS
func BFS() {
    var sortedMap = map.map{$0.sorted(by: <)}
    var visited = [V]
    var queue = [V]
    
    while !queue.isEmpty {
        let node = queue.removeFirst()
        for branch in sortedMap[node] {
            if !visited.contains(branch) {
                queue.append(branch)
                visited.append(branch)
            }
        }
    }
    print(visited.map{String($0)}.joined(separator: " "))
}

DFSByRecursion()
DFSByStack()
BFS()
