//10845 큐
import Foundation

var queue = [Int]()

for _ in 0..<Int(readLine()!)! {
    let input = readLine()!.split(separator: " ").map{String($0)}
    command(input)
}

func command(_ input: [String]) {
    switch input[0] {
    case "push":
        queue.append(Int(input[1])!)
    case "pop":
        if queue.isEmpty {
            print(-1)
        } else {
            print(queue.removeFirst())
        }
    case "size":
        print(queue.count)
    case "empty":
        print(queue.isEmpty ? 1 : 0)
    case "front":
        print(queue.isEmpty ? -1 : queue.first!)
    case "back":
        print(queue.isEmpty ? -1 : queue.last!)
    default:
        return
    }
}
