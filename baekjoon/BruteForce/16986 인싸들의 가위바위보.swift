//
//  Algorithms
//
//  Created by 서충원
//

import Foundation

//16986 인싸들의 가위바위보
let NK = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (N,K) = (NK[0], NK[1])
var map = [[Int]]()
var kArr = [Int]()
var mArr = [Int]()
var visited = Array(repeating: -1, count: N)
var result = 0

//Input
for _ in 0..<N {
    let line = readLine()!.split(separator: " ").map{ Int(String($0))! }
    map.append(line)
}
kArr = readLine()!.split(separator: " ").map{ Int(String($0))!-1 }
mArr = readLine()!.split(separator: " ").map{ Int(String($0))!-1 }

//Solution
if N >= K {
    permutation(n: 0)
}

print(result)

func permutation(n: Int) {
    if n == N {
        if check(arr: visited) == 1 { result = 1 }
        return
    }
    
    for i in 0..<N {
        if visited[i] == -1 {
            visited[i] = n
            permutation(n: n+1)
            visited[i] = -1
        }
    }
}

func check(arr: [Int]) -> Int {
    var winCount = [0, 0, 0]
    let zipArr = [arr, kArr, mArr]
    var previous = (0,arr[0])
    var index = [0,0,0]
    
    var current = 1
    while !winCount.contains(K) {
        let next = 3 - (current + previous.0)
        
        switch map[previous.1][zipArr[current][index[current]]] {
        case 0:
            //i가 이겼을 때
            winCount[current] += 1
            index[previous.0] += 1
            previous = (current, zipArr[current][index[current]])
        case 2:
            //i가 졌을 때
            winCount[previous.0] += 1
            index[current] += 1
        default:
            //비겼을 때
            if previous.0 < current {
                winCount[current] += 1
                index[previous.0] += 1
                previous = (current, zipArr[current][index[current]])
            } else {
                winCount[previous.0] += 1
                index[current] += 1
            }
        }
        
        index[previous.0] += 1
        if index[0] >= N { break }
        previous = (previous.0, zipArr[previous.0][index[previous.0]])
        
        current = next
    }
    
    return winCount[0] == K ? 1 : 0
}
