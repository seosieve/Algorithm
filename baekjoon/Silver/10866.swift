//10866 덱
import Foundation

var deck = [Int]()

for _ in 0..<Int(readLine()!)! {
    let input = readLine()!.split(separator: " ").map{String($0)}
    command(input)
}

func command(_ input: [String]) {
    switch input[0] {
    case "push_front":
        deck.insert(Int(input[1])!, at: 0)
    case "push_back":
        deck.append(Int(input[1])!)
    case "pop_front":
        if deck.isEmpty {
            print(-1)
        } else {
            print(deck.removeFirst())
        }
    case "pop_back":
        if deck.isEmpty {
            print(-1)
        } else {
            print(deck.removeLast())
        }
    case "size":
        print(deck.count)
    case "empty":
        print(deck.isEmpty ? 1 : 0)
    case "front":
        print(deck.isEmpty ? -1 : deck.first!)
    case "back":
        print(deck.isEmpty ? -1 : deck.last!)
    default:
        return
    }
}
