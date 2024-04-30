//
//  Algorithms
//
//  Created by 서충원
//

import Foundation

//1493 박스 채우기
let box = readLine()!.split(separator: " ").map{Int(String($0))!}
let (length, width, height) = (box[0], box[1], box[2])
let N = Int(readLine()!)!
var cubeArr = [(length: Int, count: Int)]()
var result = 0
var isPossible = true

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let length = Int(pow(2, Double(input[0])))
    cubeArr.append((length, input[1]))
}

cubeArr.sort{ $0.0 > $1.0 }

func divide(length: Int, width: Int, height: Int) {
    if length == 0 || width == 0 || height == 0 { return }
    
    let shortest = min(length, width, height)
    var cubeLength = 0
    
    for i in 0..<N {
        if cubeArr[i].length <= shortest && cubeArr[i].count != 0 {
            cubeLength = cubeArr[i].length
            cubeArr[i].count -= 1
            result += 1
            break
        }
    }
    
    if cubeLength == 0 {
        isPossible = false
        return
    }
    
    divide(length: length, width: width, height: height-cubeLength)
    divide(length: length-cubeLength, width: width, height: cubeLength)
    divide(length: cubeLength, width: width-cubeLength, height: cubeLength)
}

divide(length: length, width: width, height: height)

print(isPossible ? result : -1)
