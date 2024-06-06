//
//  Algorithms
//
//  Created by 서충원
//

import Foundation

//16637 괄호 추가하기
let N = Int(readLine()!)!
let operatorNum = N/2
var result = Int.min

let line = readLine()!.map{String($0)}
var numberArr = stride(from: 0, to: N, by: 2).map{ Int(line[$0])! }
var operatorArr = stride(from: 1, to: N, by: 2).map{ line[$0] }

for count in 0...(operatorNum+1)/2 {
    combi(count: count, index: 0, arr: [])
}

print(result)

func combi(count: Int, index: Int, arr: [Int]) {
    if arr.count == count {
        let container = (numberArr, operatorArr)
        calculate(arr: arr)
        numberArr = container.0
        operatorArr = container.1
        return
    }
    
    for i in index..<operatorNum {
        if arr.isEmpty || arr.last! + 1 != i {
            combi(count: count, index: i+1, arr: arr+[i])
        }
    }
}

func calculate(arr: [Int]) {
    //Priority Loop
    for i in arr {
        operatorAction(index: i)
        operatorArr[i] = "x"
    }
    //Entire Loop
    for i in 0..<operatorNum {
        operatorAction(index: i)
    }
    
    result = max(result, numberArr.last!)
}

func operatorAction(index i: Int) {
    let (lhs, rhs) = (numberArr[i], numberArr[i+1])
    switch operatorArr[i] {
    case "+":
        numberArr[i] = lhs + rhs
    case "-":
        numberArr[i] = lhs - rhs
    case "*":
        numberArr[i] = lhs * rhs
    default:
        break
    }
    numberArr[i+1] = numberArr[i]
}
