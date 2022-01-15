//1012 유기농 배추
import Foundation

func movingCabbage(_ field: inout [[Int]], _ x: Int, _ y: Int, _ maxX: Int, _ maxY: Int) {
    field[x][y] = 0
    if x-1 >= 0 {
        if field[x-1][y] == 1 {
            movingCabbage(&field, x-1, y, maxX, maxY)
        }
    }
    if y-1 >= 0 {
        if field[x][y-1] == 1 {
            movingCabbage(&field, x, y-1, maxX, maxY)
        }
    }
    if x+1 <= maxX-1 {
        if field[x+1][y] == 1 {
            movingCabbage(&field, x+1, y, maxX, maxY)
        }
    }
    if y+1 <= maxY-1 {
        if field[x][y+1] == 1 {
            movingCabbage(&field, x, y+1, maxX, maxY)
        }
    }
}

for _ in 0..<Int(readLine()!)! {
    let MNK = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (M,N,K) = (MNK[0], MNK[1], MNK[2])
    var field = Array(repeating: Array(repeating: 0, count: M), count: N)
    var earthwormCount = 0
    for _ in 0..<K {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        field[input[1]][input[0]] = 1
    }
    
    for row in 0..<N {
        for col in 0..<M {
            if field[row][col] == 1 {
                earthwormCount += 1
                movingCabbage(&field, row, col, N, M)
            }
        }
    }
    print(earthwormCount)
}
