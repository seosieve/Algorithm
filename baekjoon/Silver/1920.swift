// 1920 수 찾기
import Foundation

//1
let N = Int(readLine()!)!
var input = 1
var stack = [Int]()
var result = [Int]()
var output = [String]()

for _ in 1...N {
    result.append(Int(readLine()!)!)
}

while result != [] {
    if stack.last == result[0] {
        stack.removeLast()
        result.remove(at: 0)
        output.append("-")
    } else {
        stack.append(input)
        if input > N {
            output = ["NO"]
            break
        }
        input += 1
        output.append("+")
    }
}
print(output.joined(separator: "\n"))
//2
let N = Int(readLine()!)!
var input = 1
var stack = [Int]()
var result = [Int]()
var output = [String]()
var index = 0

for _ in 1...N {
    result.append(Int(readLine()!)!)
}

while index <= N-1 {
    if stack.last == result[0] {
        stack.removeLast()
        index += 1
        output.append("-")
    } else {
        stack.append(input)
        if input > N {
            output = ["NO"]
            break
        }
        input += 1
        output.append("+")
    }
}
print(output.joined(separator: "\n"))
