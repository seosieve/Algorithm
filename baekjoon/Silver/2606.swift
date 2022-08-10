import Foundation

//2606 바이러스
let computer = Int(readLine()!)!
var graph = Array(repeating: [Int](), count: computer+1)
for _ in 0..<Int(readLine()!)! {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    graph[input[0]].append(input[1])
    graph[input[1]].append(input[0])
}

var queue = [Int]()
var visited = Array(repeating: false, count: computer+1)
var output = 0

queue.append(1)
visited[1] = true
while !queue.isEmpty {
    let node = queue.removeFirst()
    for branch in graph[node] {
        if visited[branch] != true {
            queue.append(branch)
            visited[branch] = true
            output += 1
        }
    }
}

print(output)
