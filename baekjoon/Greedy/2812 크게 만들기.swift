//
//  Algorithms
//
//  Created by 서충원
//

import Foundation

//2812 크게 만들기
let NK = readLine()!.split(separator: " ").map{Int(String($0))!}
var (N,K) = (NK[0], NK[1])
var numArr = readLine()!.map{$0}
var stack = [Character]()

for i in 0..<N {
    while !stack.isEmpty && K > 0 && stack.last! < numArr[i] {
        stack.removeLast()
        K -= 1
    }
    
    stack.append(numArr[i])
}

while K > 0 {
    stack.removeLast()
    K -= 1
}

print(String(stack))
