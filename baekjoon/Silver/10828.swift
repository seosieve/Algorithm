//10828 스택
import Foundation

var stack = [Int]()

for _ in 0..<Int(readLine()!)! {
    let input = readLine()!.split(separator: " ").map{String($0)}
    command(input)
}

func command(_ input: [String]) {
    switch input[0] {
    case "push":
        stack.append(Int(input[1])!)
    case "pop":
        if stack.isEmpty {
            print(-1)
        } else {
            print(stack.removeLast())
        }
    case "size":
        print(stack.count)
    case "empty":
        print(stack.isEmpty ? 1 : 0)
    case "top":
        print(stack.isEmpty ? -1 : stack.last!)
    default:
        return
    }
}
