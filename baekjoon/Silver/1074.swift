//1074 Z
import Foundation

func Zcircuit(_ N: Int, _ r: Int, _ c: Int) {
    if N == 0 { return }
    let divide = Int(pow(2,Double(N))) / 2
    if r < divide && c < divide {
        count += 0
        Zcircuit(N-1, r, c)
    } else if r < divide && c >= divide {
        count += Int(pow(4,Double(N-1))) * 1
        Zcircuit(N-1, r, c-divide)
    } else if r >= divide && c < divide {
        count += Int(pow(4,Double(N-1))) * 2
        Zcircuit(N-1, r-divide, c)
    } else {
        count += Int(pow(4,Double(N-1))) * 3
        Zcircuit(N-1, r-divide, c-divide)
    }
}

let Nrc = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, r, c) = (Nrc[0], Nrc[1], Nrc[2])
var count = 0
Zcircuit(N, r, c)
print(count)
