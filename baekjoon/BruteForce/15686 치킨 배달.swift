//
//  Algorithms
//
//  Created by 서충원
//

import Foundation

//15686 치킨 배달
let NM = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N,M) = (NM[0], NM[1])
var map = [[Int]]()
var houses = [(Int,Int)]()
var chickenHouses = [(Int,Int)]()
var result = Int.max

for i in 0..<N {
    let line = readLine()!.split(separator: " ").map{Int(String($0))!}
    map.append(line)
    for j in 0..<N {
        switch line[j] {
        case 1:
            houses.append((i,j))
        case 2:
            chickenHouses.append((i,j))
        default:
            break
        }
    }
}

//모든 빼주어야하는 치킨집 좌표 구하기
func combination(index: Int, arr: [Int]) {
    if arr.count == M {
        result = min(result, chickenDistance(arr: arr))
        return
    }
    
    for i in index..<chickenHouses.count {
        combination(index: i+1, arr: arr+[i])
    }
}

//최소 치킨거리 구하기
func chickenDistance(arr: [Int]) -> Int {
    var distanceSum = 0
    
    for house in houses {
        var minDistance = Int.max
        for (index, chickenHouse) in chickenHouses.enumerated() {
            guard arr.contains(index) else { continue }
            let distance = abs(chickenHouse.0 - house.0) + abs(chickenHouse.1 - house.1)
            minDistance = min(minDistance, distance)
        }
        distanceSum += minDistance
    }
    return distanceSum
}

combination(index: 0, arr: [])
print(result)
