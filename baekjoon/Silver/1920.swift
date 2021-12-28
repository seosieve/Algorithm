// 1920 수 찾기
import Foundation

//1
let N = Int(readLine()!)!
let numArr = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted(by: <)
let M = Int(readLine()!)!
let inputArr = readLine()!.split(separator: " ").map{Int(String($0))!}

for input in inputArr {
    var min = 0
    var max = N-1
    while min <= max {
        let mid = (min+max) / 2
        if input == numArr[mid] {
            print("1")
            break
        } else if input < numArr[mid] {
            max = mid - 1
        } else {
            min = mid + 1
        }
    }
    if min > max {
        print("0")
    }
}
//2
// 라이노님의 FileIO
final class FileIO {
    private var buffer:[UInt8]
    private var index: Int
    
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
        index = 0
    }
    
    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        
        return buffer.withUnsafeBufferPointer { $0[index] }
    }
    
    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45{ isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }
        
        return sum * (isPositive ? 1:-1)
    }
    
    @inline(__always) func readString() -> String {
        var str = ""
        var now = read()
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        
        while now != 10
                && now != 32 && now != 0 {
            str += String(bytes: [now], encoding: .ascii)!
            now = read()
        }
        
        return str
    }
}

let file = FileIO()
let N = file.readInt()
var numArr = Set<Int>()
for _ in 0..<N {
    numArr.insert(file.readInt())
}
let M = file.readInt()
var inputArr = [Int]()
for _ in 0..<M {
    inputArr.append(file.readInt())
}
var output = ""
inputArr.forEach { input in
    output += numArr.contains(input) ? "1\n" : "0\n"
}
print(output)
