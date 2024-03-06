//
//  Algorithms
//
//  Created by 서충원
//

import Foundation

//1182 부분수열의 합
let NS = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N,S) = (NS[0], NS[1])
var map = readLine()!.split(separator: " ").map{Int(String($0))!}
var result = 0

func recursion(n: Int, sum: Int) {
    if n == 0 {
        if sum == S {
            result += 1
        }
        return
    }
    //현재 요소 선택 X
    recursion(n: n-1, sum: sum)
    //현재 요소 선택 O
    recursion(n: n-1, sum: sum+map[N-n])
}

recursion(n: N, sum: 0)
if S == 0 {
    result -= 1
}
print(result)
