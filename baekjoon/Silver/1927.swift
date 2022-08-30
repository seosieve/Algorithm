import Foundation

//1927 최소힙 8/30
let N = Int(readLine()!)!
var heap = [0]

func insert(_ num: Int) {
    heap.append(num)
    var node = heap.count-1
    while node != 1 {
        let parent = node/2
        if heap[parent] > heap[node] {
            heap.swapAt(parent, node)
            node /= 2
        } else {
            break
        }
    }
}

func delete() {
    print(heap[1])
    heap.swapAt(1, heap.count-1)
    heap.removeLast()
    var node = 1
    while true {
        var child = 0
        if node*2 == heap.count-1 {
            child = node*2
        } else if node*2 > heap.count-1 {
            break
        } else {
            if heap[node*2] > heap[node*2+1] {
                child = node*2+1
            } else {
                child = node*2
            }
        }
        
        if heap[child] < heap[node] {
            heap.swapAt(child, node)
            node = child
        } else {
            break
        }
    }
}

for _ in 0..<N {
    let input = Int(readLine()!)!
    if input == 0 {
        if heap.count == 1 {
            print("0")
        } else {
            delete()
        }
    } else {
        insert(input)
    }
}

//1927 최소힙
var heap = [Int]()

func insert(_ num: Int) {
    if heap.isEmpty {
        heap.append(-1)
        heap.append(num)
    } else {
        heap.append(num)
    }
    var index = heap.count-1
    while index != 1 && num < heap[index/2] {
        heap.swapAt(index, index/2)
        index /= 2
    }
}

func delete() {
    if heap.isEmpty || heap.count == 1 {
        print("0")
    } else if heap.count == 2 {
        print(heap.removeLast())
    } else {
        print(heap[1])
        heap[1] = heap.removeLast()
        var parent = 1
        var child: Int
        while true {
            child = parent*2
            if child+1 <= heap.count-1 && heap[child] > heap[child+1] {
                child += 1
            }
            if child > heap.count-1 || heap[parent] < heap[child] { break }
            heap.swapAt(parent, child)
            parent = child
        }
    }
}

let N = Int(readLine()!)!
for _ in 0..<N {
    let input = Int(readLine()!)!
    if input == 0 {
        delete()
    } else {
        insert(input)
    }
}
