//
//  Algorithms
//
//  Created by 서충원
//

import Foundation

//1992 쿼드트리
let N = Int(readLine()!)!
var map = Array(repeating: [Int](), count: N)
var result = ""

for i in 0..<N {
    let line = readLine()!.map{Int(String($0))!}
    map[i] = line
}

func check(x: Int, y: Int, n: Int) -> Bool {
    for i in x..<x+n {
        for j in y..<y+n {
            if map[x][y] != map[i][j] {
                return false
            }
        }
    }
    return true
}

func recursion(x: Int, y: Int, n: Int) {
    if check(x: x, y: y, n: n) {
        result += "\(map[x][y])"
        return
    }
    
    result += "("
    for i in 0..<2 {
        for j in 0..<2 {
            recursion(x: x+i*n/2, y: y+j*n/2, n: n/2)
        }
    }
    
    result += ")"
}

recursion(x: 0, y: 0, n: N)
print(result)
