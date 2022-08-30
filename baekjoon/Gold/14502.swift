//14502 연구소
let NM = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, M) = (NM[0], NM[1])

var map = [[Int]]()
var queue = [(Int, Int)]()
var blank = [(Int, Int)]()
var output = 0

for row in 0..<N {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    input.enumerated().forEach { (index, node) in
        if node == 2 {
            queue.append((row, index))
        }
        if node == 0 {
            blank.append((row, index))
        }
    }
    map.append(input)
}

func BFS(_ map: inout [[Int]]) -> Int {
    var instantQueue = queue
    var index = 0
    while index < instantQueue.count {
        let node = instantQueue[index]
        for i in [(-1, 0),(1, 0),(0, -1),(0, 1)] {
            let (n,m) = (node.0 + i.0, node.1 + i.1)
            if (0..<N).contains(n) && (0..<M).contains(m) && map[n][m] == 0 {
                map[n][m] = 2
                instantQueue.append((n,m))
            }
        }
        index += 1
    }
    var count = 0
    for row in 0..<N {
        for col in 0..<M {
            if map[row][col] == 0 {
                count += 1
            }
        }
    }
    return count
}

for first in 0..<blank.count {
    for second in first+1..<blank.count {
        for third in second+1..<blank.count {
            var instantMap = map
            instantMap[blank[first].0][blank[first].1] = 1
            instantMap[blank[second].0][blank[second].1] = 1
            instantMap[blank[third].0][blank[third].1] = 1
            let result = BFS(&instantMap)
            output = max(output, result)
        }
    }
}

print(output)
