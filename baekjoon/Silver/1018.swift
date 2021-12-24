//1018 체스판 다시 칠하기
import Foundation

let MN = readLine()!.split(separator: " ").map{Int(String($0))!}
let M = MN[0]
let N = MN[1]
var board: [[String]] = Array(repeating: [], count: M)
var minimum = 64

for row in 0...M-1 {
    board[row] = readLine()!.map{String($0)}
}

for startCol in 0...N-8 {
    for startRow in 0...M-8 {
        var Wstart = 0
        var Bstart = 0
        for col in startCol...startCol+7 {
            for row in startRow...startRow+7 {
                if (row+col)%2 == 0 {
                    if board[row][col] == "W" {
                        Bstart += 1
                    } else {
                        Wstart += 1
                    }
                }
                else {
                    if board[row][col] == "W" {
                        Wstart += 1
                    } else {
                        Bstart += 1
                    }
                }
            }
        }
        let change = min(Wstart, Bstart)
        if change < minimum {
            minimum = change
        }
    }
}
print(minimum)
