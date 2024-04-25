//
//  Algorithms
//
//  Created by 서충원
//

import Foundation

//2212 센서
let N = Int(readLine()!)!
let K = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{Int(String($0))!}
arr.sort(by: <)
var distance = zip(arr.dropFirst(), arr).map(-)
distance.sort(by: <)

print(N < K ? 0 : distance.prefix(N-K).reduce(0, +))
