//
//  Algorithms
//
//  Created by 서충원
//

import Foundation

//15748 Rest Stops
final class FileIO { 
    private let buffer:[UInt8]
    private var index: Int = 0

    init(fileHandle: FileHandle = FileHandle.standardInput) {

        buffer = Array(try! fileHandle.readToEnd()!)+[UInt8(0)]
        // 인덱스 범위 넘어가는 것 방지
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }

        return buffer[index]
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }

    @inline(__always) func readString() -> String {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return String(bytes: Array(buffer[beginIndex..<(index-1)]), encoding: .ascii)!
    }

    @inline(__always) func readByteSequenceWithoutSpaceAndLineFeed() -> [UInt8] {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return Array(buffer[beginIndex..<(index-1)])
    }
}

let fileIO = FileIO()
let (L,N,F,B) = (fileIO.readInt(), fileIO.readInt(), fileIO.readInt(), fileIO.readInt())
var pointArr = [(distance: Int, satisfy: Int)]()
var current = 0
var result = 0

for _ in 0..<N {
    let distance = fileIO.readInt()
    let satisfy = fileIO.readInt()
    pointArr.append((distance, satisfy))
}

pointArr.sort{ $0.1 == $1.1 ? $0.0 < $1.0 : $0.1 > $1.1 }

for point in pointArr {
    if current < point.distance {
        result += point.satisfy * (point.distance - current) * (F - B)
        current = point.distance
    }
}

print(result)
