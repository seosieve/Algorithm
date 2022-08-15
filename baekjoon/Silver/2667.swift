import Foundation

//2667 단지번호붙이기
let N = Int(readLine()!)!
var map = [[Int]]()
for _ in 0..<N {
    let input = Array(readLine()!).map{Int(String($0))!}
    map.append(input)
}

var queue = [(Int,Int)]()
var complex = [Int]()

for row in 0..<N {
    for col in 0..<N {
        if map[row][col] == 1 {
            var count = 0
            queue.append((row,col))
            map[row][col] = 0
            while !queue.isEmpty {
                let node = queue.removeFirst()
                count += 1
                for i in [(-1,0), (1,0), (0,-1), (0,1)] {
                    let (m,n) = (node.0+i.0, node.1+i.1)
                    if (0..<N).contains(m) && (0..<N).contains(n) && map[m][n] == 1 {
                        queue.append((m, n))
                        map[m][n] = 0
                    }
                }
            }
            complex.append(count)
        }
    }
}
complex.sort(by: <)
let result = complex.map{String($0)}

print(result.count, result.joined(separator: "\n"), separator: "\n")
