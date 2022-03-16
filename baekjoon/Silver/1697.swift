import Foundation

//1697 숨바꼭질
let NM = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N,M) = (NM[0], NM[1])
var book1 = [String : Int]()
var book2 = Array(repeating: "", count: N)
for index in 0..<N {
    let pokemon = readLine()!
    book1[pokemon] = index+1
    book2[index] = pokemon
}

for _ in 0..<M {
    let input = readLine()!
    if let num = Int(input) {
        print(book2[num-1])
    } else {
        print(book1[input]!)
    }
}
