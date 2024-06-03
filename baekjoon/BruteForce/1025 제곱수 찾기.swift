//
//  Algorithms
//
//  Created by 서충원
//

import Foundation

//1025 제곱수 찾기
let NM = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, M) = (NM[0], NM[1])
var map = [[Int]]()
var resultSet = Set<Int>()

for _ in 0..<N {
    let line = readLine()!.map{Int(String($0))!}
    map.append(line)
}

for i in 0..<N {
    for j in 0..<M {
        for bufferI in -N+1..<N {
            for bufferJ in -M+1..<M {
                if bufferI == 0 && bufferJ == 0 {
                    resultSet.insert(map[i][j])
                    continue
                }
                recursion(current: (i,j), buffer: (bufferI, bufferJ), result: -1)
            }
        }
    }
}

print(main())

func main() -> Int {
    let resultArr = resultSet.sorted(by: >)
    for result in resultArr {
        if isSquare(num: result) {
            return result
        }
    }
    return -1
}

func recursion(current: (Int, Int), buffer: (Int, Int), result: Int) {
    if result != -1 { resultSet.insert(result) }
    guard (0..<N) ~= current.0 && (0..<M) ~= current.1 else { return }
    let currentResult = result == -1 ? 0 : result
    let next = (current.0+buffer.0, current.1+buffer.1)
    let newResult = currentResult * 10 + map[current.0][current.1]
    recursion(current: next, buffer: buffer, result: newResult)
}

func isSquare(num: Int) -> Bool {
    let sqrtValue = sqrt(Double(num))
    return sqrtValue == floor(sqrtValue)
}
