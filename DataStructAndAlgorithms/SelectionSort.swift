/**
 
 在选择排序过程中，数组仍然被分作有序和无序两部分。
 而选择排序中的“选择”是指不断从无序序列中选择最小的值放入到有序序列的最后的位置，
 换句话说就是从现有的无序序列中找出那个最小的值，然后与无序序列的第一个值进行交换，然后缩小无序序列的范围即可。
 
 
 排序方法                 最好情况                最坏情况             平均情况              稳定性       空间复杂度
 插入排序                 O(n)                   O(n2)              O(n2)                 稳定        O(1)
 选择排序                 O(n2)                  O(n2)              O(n2)                不稳定       O(1)
 希尔排序                 O(n)                   O(n2)              O(n1.3)              不稳定       O(1)
 
 快速排序                 O(nlogn)               O(n2)              O(nlogn)             不稳定       O(1)
 归并排序                 O(nlogn)               O(nlogn)           O(nlogn)               稳定       O(1)
 堆排序                   O(nlogn)               O(nlogn)           O(nlogn)             不稳定       O(1)
 
 冒泡排序                 O(n)                   O(n2)              O(n2)                  稳定       O(1)
 
 基数排序                O(n*k)                 O(n*k)              O(n*k)                 稳定          O(n+k)
 计数排序                O(n+k)                 O(n+k)               O(n+k)                稳定          O(n+k)
 桶排序                  O(n)                   O(n2)                O(n+k)                稳定          O(n+k)
 
 空间复杂度
 + 简单排序和堆排序都是0(1)
 + 快速排序为0(logn)，要为递归程序执行过程栈所需的辅助空间
 + 归并排序和基数排序所需辅助空间最多，为O(n)
 
 稳定：如果a原本在b前面，而a=b，排序之后a仍然在b的前面。
 不稳定：如果a原本在b的前面，而a=b，排序之后 a 可能会出现在 b 的后面。
 时间复杂度：对排序数据的总的操作次数。反映当n变化时，操作次数呈现什么规律。
 空间复杂度：是指算法在计算机内执行时所需存储空间的度量，它也是数据规模n的函数。
 ---------------------------------------------------------*/
import Foundation
func selectionSort(items: [Int]) -> [Int] {
    var list = items
    for index in 0..<list.count {
        var nextIndex = index + 1
        var min = list[index]
        var cursor = index
        while nextIndex < list.count {
            if list[nextIndex] < min {
                min = list[nextIndex]
                cursor = nextIndex
            }
            nextIndex += 1
        }
        if cursor != index {
            let temp = list[index]
            list[index] = list[cursor]
            list[cursor] = temp
        }
    }
    return list
}

var temp = [2, 5, 1]
print(selectionSort(items: temp))

/// [2, 5, 1]   min = 2      [2, 5, 1]      min = 1   --->  [1, 5, 2]
//      n                           n
//   c                              c
//   i

/// [1, 5, 2]   min = 1      [1, 5, 2]      min = 2   --->  [1, 2, 5]
//      n                           n
//   c                              c
//      i
extension Array where Element: Comparable {
    public mutating func selectionSort(sort: (Element, Element) -> Bool) {
        for index in 0..<count {
            var cursor = index
            var next = index + 1
            var candicate = self[index]
            while next < count {
                if sort(self[next], candicate) {
                    candicate = self[next]
                    cursor = next
                }
                next += 1
            }
            if index != cursor {
                swapAt(index, cursor)
            }
        }
    }
}
var array = [Int]()
(0...10).forEach { _ in
    let num = Int(arc4random() % 100)
    array.append(num)
}
array.selectionSort(sort: <)
print(array)
