// 1966 프린터 큐
import Foundation

for _ in 1...Int(readLine()!)! {
    let NM = readLine()!.split(separator: " ").map{Int(String($0))!}
    var inputArr = Array(repeating:Array(repeating: 1, count: 2), count:NM[0])
    var inputNum = readLine()!.split(separator: " ").map{Int(String($0))!}
    for (index,input) in inputNum.enumerated() {
        inputArr[index][0] = index
        inputArr[index][1] = input
    }
    inputNum.sort(by: >)
    var output = 0
    
    while true {
        if inputArr[0][1] != inputNum[0] {
            inputArr.append(inputArr[0])
            inputArr.remove(at: 0)
        } else {
            output += 1
            inputNum.remove(at: 0)
            if inputArr[0][0] == NM[1] {
                break
            }
            inputArr.remove(at: 0)
        }
    }
    print(output)
}
