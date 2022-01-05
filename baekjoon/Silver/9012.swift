//9012 괄호
import Foundation

//1
for _ in 0..<Int(readLine()!)! {
    let inputArr = readLine()!.map{String($0)}
    var stack = [Int]()

    for input in inputArr {
        if input == "(" {
            stack.append(1)
        } else {
            if stack.isEmpty {
                stack.append(2)
                break
            } else {
                stack.removeLast()
            }
        }
    }
    print(stack.isEmpty ? "YES" : "NO")
}
//2
for _ in 0..<Int(readLine()!)! {
    let inputArr = readLine()!.map{String($0)}
    var bracketCount = 0

    for input in inputArr {
        if input == "(" {
            bracketCount += 1
        } else {
            if bracketCount == 0 {
                bracketCount = -1
                break
            } else {
                bracketCount -= 1
            }
        }
    }
    print(bracketCount == 0 ? "YES" : "NO")
}
