//1436 영화감독 숌
import Foundation

//1
let input = Int(readLine()!)!
var number = 666
var count = 0

while true {
    var sixCount = 0
    var numberInstance = number
    while numberInstance != 0 {
        if numberInstance % 10 == 6 {
            sixCount += 1
        } else {
            sixCount = 0
        }
        if sixCount == 3 {
            count += 1
            break
        }
        numberInstance /= 10
    }

    if count == input {
        print(number)
        break
    }
    number += 1
}
//2
let input = Int(readLine()!)!
var seriesArr: [String] = []

for index in 0...3000 {
    let indexArr = String(index).map{String($0)}
    if indexArr.last == "6" {
        if indexArr.count >= 2, indexArr[indexArr.count-2] == "6" {
            if indexArr.count >= 3, indexArr[indexArr.count-3] == "6" {
                // 666 일 때
                if indexArr.count == 3 {
                    for sixHunSixtySix in 0...999 {
                        if sixHunSixtySix < 10 {
                            seriesArr.append("66600"+String(sixHunSixtySix))
                        } else if sixHunSixtySix >= 10, sixHunSixtySix < 100 {
                            seriesArr.append("6660"+String(sixHunSixtySix))
                        } else if sixHunSixtySix >= 100 {
                            seriesArr.append("666"+String(sixHunSixtySix))
                        }
                    }
                } else if indexArr.count == 4 {
                    for sixHunSixtySix in 0...999 {
                        if sixHunSixtySix < 10 {
                            seriesArr.append(indexArr[0]+"66600"+String(sixHunSixtySix))
                        } else if sixHunSixtySix >= 10, sixHunSixtySix < 100 {
                            seriesArr.append(indexArr[0]+"6660"+String(sixHunSixtySix))
                        } else if sixHunSixtySix >= 100 {
                            seriesArr.append(indexArr[0]+"666"+String(sixHunSixtySix))
                        }
                    }
                }
            } else {
                // 66일 때
                if indexArr.count == 2 {
                    for sixtySix in 0...99 {
                        if sixtySix < 10 {
                            seriesArr.append("6660"+String(sixtySix))
                        } else {
                            seriesArr.append("666"+String(sixtySix))
                        }
                    }
                } else if indexArr.count == 3 {
                    for sixtySix in 0...99 {
                        if sixtySix < 10 {
                            seriesArr.append(indexArr[0]+"6660"+String(sixtySix))
                        } else {
                            seriesArr.append(indexArr[0]+"666"+String(sixtySix))
                        }
                    }
                } else if indexArr.count == 4 {
                    for sixtySix in 0...99 {
                        if sixtySix < 10 {
                            seriesArr.append(indexArr[0]+indexArr[1]+"6660"+String(sixtySix))
                        } else {
                            seriesArr.append(indexArr[0]+indexArr[1]+"666"+String(sixtySix))
                        }
                    }
                }
            }
        } else {
            // 6일 때
            if indexArr.count == 1 {
                for six in 0...9 {
                    seriesArr.append("666"+String(six))
                }
            } else if indexArr.count == 2 {
                for six in 0...9 {
                    seriesArr.append(indexArr[0]+"666"+String(six))
                }
            } else if indexArr.count == 3 {
                for six in 0...9 {
                    seriesArr.append(indexArr[0]+indexArr[1]+"666"+String(six))
                }
            } else if indexArr.count == 4 {
                for six in 0...9 {
                    seriesArr.append(indexArr[0]+indexArr[1]+indexArr[2]+"666"+String(six))
                }
            }
        }
    } else {
        seriesArr.append(String(index)+"666")
    }
}

seriesArr[0] = "666"
print(seriesArr[input-1])
