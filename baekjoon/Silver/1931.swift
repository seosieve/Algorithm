import Foundation

//1931 회의실 배정
var conferenceArr = [(Int, Int)]()
var startPoint = 0
var outputCount = 0

for _ in 0..<Int(readLine()!)! {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (start, end) = (input[0], input[1])
    conferenceArr.append((start,end))
}

conferenceArr.sort { (a: (Int,Int), b :(Int,Int)) -> Bool in
    if a.1 == b.1{
        return a.0 < b.0
    } else {
        return a.1 < b.1
    }
}

for conference in conferenceArr {
    if conference.0 >= startPoint {
        startPoint = conference.1
        outputCount += 1
    }
}

print(outputCount)
