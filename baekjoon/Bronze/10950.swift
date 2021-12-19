// 10951 A+B - 4
import Foundation

//1
while let input = readLine() {
    print(input.split(separator: " ").map{Int(String($0))!}.reduce(0){$0 + $1})
}

//2
while true {
    let input = readLine()!
    if input == "" { break }
    print(input.split(separator: " ").map{Int(String($0))!}.reduce(0){$0 + $1})
}

