//4949 균형잡힌 세상
import Foundation

while let input = readLine(), input != "." {
    let inputArr = input.map{String($0)}
    var stack = [Int]()

    for char in inputArr {
        if char == "(" {
            stack.append(1)
        } else if char == "[" {
            stack.append(2)
        } else if char == ")" {
            if stack.last == 1 {
                stack.removeLast()
            } else {
                stack.append(3)
                break
            }
        } else if char == "]" {
            if stack.last == 2 {
                stack.removeLast()
            } else {
                stack.append(3)
                break
            }
        }
    }
    print(stack.isEmpty ? "yes" : "no")
}

