// 10998 AxB
import Foundation

print(readLine()!.split(separator: " ").map{Int(String($0))!}.reduce(1){$0*$1})
