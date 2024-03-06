//
//  Algorithms
//
//  Created by 서충원
//

import Foundation

//1629 곱셈
let ABC = readLine()!.split(separator: " ").map{Int(String($0))!}
let (A,B,C) = (ABC[0],ABC[1],ABC[2])

func recursion(N: Int) -> Int {
    if N == 0 { return 1 }
    print(N)
    
    if N%2 == 0 {
        let r = recursion(N: N/2)
        
        return r % C * r % C
    } else {
        let r = recursion(N: (N-1)/2)
        
        return r % C * r % C * A % C
    }
}

print(recursion(N: B))
