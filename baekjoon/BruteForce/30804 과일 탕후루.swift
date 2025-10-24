//
//  Algorithms
//
//  Created by 서충원
//

import Foundation

let N = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{ Int(String($0))! }
var countDic = [Int: Int]()
var (left, right) = (0, 0)
var output = 0

while right < N {
    
    countDic[arr[right], default: 0] += 1
    
    while countDic.keys.count > 2 {
        countDic[arr[left], default: 0] -= 1
        if countDic[arr[left]] == 0 { countDic.removeValue(forKey: arr[left]) }
        left += 1
    }
    
    output = max(output, right - left + 1)
    right += 1
}

print(output)
