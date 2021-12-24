// 10952 A+B - 5
import Foundation

while true {
    let input = readLine()!
    if input = "0 0" { break }
    print(input.split(separator: " ").map{Int(String($0))!}.reduce(0){$0 + $1})
}
