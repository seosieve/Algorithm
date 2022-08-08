import Foundation

//2178 미로 탐색
let MN = readLine()!.split(separator: " ").map{Int(String($0))!}
let (M, N) = (MN[0], MN[1])

var graph = [[Int]]()

for _ in 0..<M {
    graph.append(Array(readLine()!).map{Int(String($0))!})
}

var queue = [(Int, Int)]()
var queueNum = 0
var count = Array(repeating: Array(repeating: 0, count: N), count: M)

graph[0][0] = 0
queue.append((0,0))
count[0][0] = 1
while count[M-1][N-1] == 0 {
    let node = queue[queueNum]
    queueNum += 1
    for i in [(-1, 0),(1, 0),(0, -1),(0, 1)] {
        let (m,n) = (node.0 + i.0, node.1 + i.1)
        if (0..<M).contains(m) && (0..<N).contains(n) && graph[m][n] == 1 {
            graph[m][n] = 0
            queue.append((m,n))
            count[m][n] = count[node.0][node.1] + 1
        }
    }
}

print(count[M-1][N-1])
