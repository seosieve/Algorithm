//10773 제로
import Foundation

var stack = [Int]()
for _ in 0..<Int(readLine()!)! {
    let input = Int(readLine()!)!
    if input == 0 {
        stack.removeLast()
    } else {
        stack.append(input)
    }
}
print(stack.reduce(0,+))
