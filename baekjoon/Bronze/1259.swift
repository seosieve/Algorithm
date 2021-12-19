// 1259 팰린드롬수
import Foundation

//1
while true {
    let input = readLine()!
    if input == "0" { break }
    let inputArr = input.map{String($0)}
    var correct = "yes"
    
    for index in 0...inputArr.count-1 {
        if inputArr[index] == inputArr[inputArr.count-1-index] {
            correct = "yes"
        } else {
            correct = "no"
            break
        }
    }
    print(correct)
}

//2
while let p = readLine(), p != "0" {
    print(p == String(p.reversed()) ? "yes" : "no")
}
