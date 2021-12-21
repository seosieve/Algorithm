// 1085 직사각형에서 탈출
import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let east = input[0]
let west = input[2]-input[0]
let north = input[3]-input[1]
let south = input[1]
let map = [east,west,north,south]
print(map.min()!)
