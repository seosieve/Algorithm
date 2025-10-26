//
//  Algorithms
//
//  Created by 서충원
//

import Foundation

let T = Int(readLine()!)!

struct Pivot {
    private var start: Int
    private var end: Int
    private var arrow = true
    private var index = 0
    
    init(_ start: Int, _ end: Int) {
        self.start = start
        self.end = end
    }
    
    mutating func reverse() {
        arrow.toggle()
        index += 1
    }
    
    mutating func delete() {
        arrow ? (start += 1) : (end -= 1)
    }
    
    func output(_ arr: [Int]) {
        if start <= end {
            if index % 2 == 0 {
                print("[" + arr[start...end].map{ String($0) }.joined(separator: ",") + "]")
            } else {
                var outputArr = Array(arr[start...end].map{ String($0) })
                outputArr.reverse()
                print("[" + outputArr.joined(separator: ",") + "]")
            }
        } else if end - start == -1 {
            print("[]")
        } else {
            print("error")
        }
    }
}

for _ in 0..<T {
    let P = Array(readLine()!)
    let N = Int(readLine()!)!
    let arr = readLine()!.dropFirst().dropLast().split(separator: ",").map{ Int(String($0))! }
    var pivot = Pivot(0, N-1)
    
    for input in P {
        switch input {
        case "R":
            pivot.reverse()
        case "D":
            pivot.delete()
        default:
            break
        }
    }
    
    pivot.output(arr)
}
