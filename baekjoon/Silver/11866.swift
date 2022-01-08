//11866 요세푸스 문제 0
import Foundation
//1
let NK = readLine()!.split(separator: " ").map{Int(String($0))!}
var circle = Array(1...NK[0])
var count = 1
var index = 0
var output = [Int]()

while output.count != NK[0] {
    if circle[index] != 0 {
        if count == NK[1] {
            output.append(circle[index])
            circle[index] = 0
            count = 1
        } else {
            count += 1
        }
    }
    index += 1
    if index == NK[0] {
        index = 0
    }
}
print("<\(output.map{String($0)}.joined(separator: ", "))>")
//2
let NK = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N,K) = (NK[0], NK[1])
var circle = Array(1...N)
var answer = [Int]()
var index = -1

while true {
    index = (index + K) % circle.count
    answer.append(circle[index])
    circle.remove(at: index)
    if circle.count == 0 {
        break
    }
    index = (index - 1 + circle.count) % circle.count
}

print("<\(answer.map{String($0)}.joined(separator: ", "))>")
