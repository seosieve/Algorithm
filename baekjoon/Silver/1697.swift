import Foundation

//1697 숨바꼭질
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N,K) = (input[0],input[1])

var queue = [(0,N)]
var index = 0
var visited = Array(repeating: false, count: 100001)
visited[N] = true

while true {
    let node = queue[index]
    if node.1 == K {
        print(node.0)
        break
    }
    for i in [node.1+1, node.1-1, node.1*2] {
        if i <= 100000 && i >= 0 && !visited[i] {
            queue.append((node.0+1, i))
            visited[i] = true
        }
    }
    index += 1
}

//1697 숨바꼭질
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, K) = (input[0], input[1])

var queue = [(0, N)]
var count = 0
var visited = Array(repeating: false, count: 100001)
visited[N] = true

func BFS() {
    let node = queue[count]

    if node.1 == K {
        print(node.0)
        return
    }
    for i in [node.1-1, node.1+1, node.1*2] {
        if i >= 0 && i <= 100000 && !visited[i] {
            queue.append((node.0+1, i))
            visited[i] = true
        }
    }
    count += 1
    BFS()
}
BFS()
