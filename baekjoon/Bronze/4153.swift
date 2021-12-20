// 4153 직각삼각형
import Foundation

//1
while true {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted(by: >)
    if input == [0,0,0] { break }
    if input[0]*input[0] == (input[1]*input[1]) + (input[2]*input[2]) {
        print("right")
    } else {
        print("wrong")
    }
}

//2
while let input = readLine(), input != "0 0 0" {
    let line = input.split(separator: " ").map{Double(String($0))!}.sorted(by: >)
    let output = pow(line[0], 2) == pow(line[1], 2)+pow(line[2], 2) ? "right":"wrong"
    print(output)
}
