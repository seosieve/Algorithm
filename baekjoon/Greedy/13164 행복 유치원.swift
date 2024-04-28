//
//  Algorithms
//
//  Created by 서충원
//

import Foundation

//13164 행복 유치원
let NK = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N,K) = (NK[0], NK[1])
let childArr = readLine()!.split(separator: " ").map{Int(String($0))!}

print(zip(childArr.dropFirst(), childArr).map(-).sorted(by: <).prefix(N-K).reduce(0, +))
