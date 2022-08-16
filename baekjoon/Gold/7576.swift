//7576 토마토
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (M, N) = (input[0], input[1])

var box = [[Int]]()
var queue = [(Int, Int)]()
var index = 0
var output = 0

for row in 0..<N {
    let line = readLine()!.split(separator: " ").map{Int(String($0))!}
    for (i, col) in line.enumerated() {
        if col == 1 {
            queue.append((row, i))
        }
    }
    box.append(line)
}

while index < queue.count {
    let node = queue[index]
    for i in [(-1, 0),(1, 0),(0, -1),(0, 1)] {
        let (m, n) = (node.0+i.0, node.1+i.1)
        if (0..<N).contains(m) && (0..<M).contains(n) && box[m][n] == 0 {
            queue.append((m, n))
            box[m][n] = box[node.0][node.1]+1
        }
    }
    index += 1
}

for row in 0..<N {
    if box[row].contains(0) {
        output = -1
        break
    } else if let max = box[row].max(), output < max {
        output = max-1
    }
}
print(output)
