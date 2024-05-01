//
//  Algorithms
//
//  Created by 서충원
//

import Foundation

//1700 멀티탭 스케줄링
//남은 작업중 가장 많이 남은 것 X -> 남은 작업중 가장 멀리 있는 것 O
let NK = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N,K) = (NK[0], NK[1])
var taskArr = readLine()!.split(separator: " ").map{Int(String($0))!}
var nextArr = Array(repeating: [Int](), count: K+1)
var multiTab = [Int]()
var result = 0

for i in 0..<K {
    nextArr[taskArr[i]].append(i)
}

for task in taskArr {
    if !multiTab.contains(task) {
        if multiTab.count < N {
            multiTab.append(task)
        } else {
            let container = multiTab.map{nextArr[$0].first ?? 101}
            let index = container.firstIndex(of: container.max()!)!
            
            multiTab[index] = task
            result += 1
        }
    }
    nextArr[task].removeFirst()
}

print(result)
