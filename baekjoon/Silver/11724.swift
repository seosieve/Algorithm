import Foundation

//11724 연결 요소의 개수
let NM = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, M) = (NM[0], NM[1])

var map = Array(repeating: [Int](), count: N)
var visited = Array(repeating: false, count: N)
var output = 0

for _ in 0..<M {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    map[input[0]-1].append(input[1]-1)
    map[input[1]-1].append(input[0]-1)
}

func BFS(_ start: Int) {
    var queue = [Int]()
    var index = 0
    visited[start] = true
    queue.append(start)
    while index < queue.count {
        let node = queue[index]
        for branch in map[node] {
            if !visited[branch] {
                queue.append(branch)
                visited[branch] = true
            }
        }
        index += 1
    }
}

for node in 0..<N {
    if !visited[node] {
        BFS(node)
        output += 1
    }
}

print(output)
