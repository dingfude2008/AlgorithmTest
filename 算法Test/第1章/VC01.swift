//
//  VC01.swift
//  算法Test
//
//  Created by DFD on 2017/4/27.
//  Copyright © 2017年 DFD. All rights reserved.
//

import UIKit

var arrayQuick = [ 4, 2, 1, 3, 6, 9, 0, 8, 7, 3, 4, 2,  5, 3, 2]


struct queue {
    var data = [Int]()
    var head = 0
    var tail = 0
}

class VC01: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        playZhugan()
        
//        checkIsHuiWen(string: "123454321")
        
        
//        getQQNumberQueue()
        
//        getQQNumber()
        
//        quickSort(0, arrayQuick.count - 1)
//        
//        print(arrayQuick)
        
//        bubbeSort()
        
        //tongSort()
        
    }
    
    
    /// 接竹竿游戏的模拟
    /// 条件是，纸牌有 1- 9
    func playZhugan(){
        
        // 第一个人手里的牌
        var q1 = queue()
        q1.head = 0
        q1.data = [ 2, 4, 1, 2, 5, 6 ]
        q1.tail = q1.data.count
        
        // 第二个人手里的牌
        var q2 = queue()
        q2.head = 0
        q2.data = [ 3, 1, 3, 5, 6, 4 ]
        q2.tail = q1.data.count
        
        // 桌上的牌
        var queueTask = queue()
        queueTask.head = 0
        
        // 开始游戏
        while q1.head < q1.tail && q2.head < q2.tail {
            
            // 第一个人先出牌
            // 要出的牌
            var t = q1.data[q1.head]
            
            print("q1出牌 \(t)")
            
            if queueTask.data.contains(t) {
                
                print("q1出的牌，牌桌上有，开始收牌")
                
                // 出了一张牌，标记移动1
                q1.head += 1
                
                // 收起刚出的那张牌
                q1.data.append(t)
                q1.tail += 1
                
                // 桌上的牌是个栈，遵循后进先出的原则
                var last = queueTask.data[queueTask.tail - 1]
                
                while last != t {
                    print("q1 将桌子上的\(t)放入在自己的手里最后一位")
                    q1.data.append(last)
                    queueTask.data.remove(at: queueTask.tail - 1)
                    
                    queueTask.tail -= 1
                    last = queueTask.data[queueTask.tail - 1]
                }
                
                print("q1 将桌子上的\(t)放入在自己的手里最后一位")
                q1.data.append(last)
                queueTask.data.remove(at: queueTask.tail - 1)
                queueTask.tail -= 1
            }else{
                
                print("q1出的牌，牌桌上没有")
                
                q1.head += 1
                
                // 桌上的牌加一
                queueTask.data.append(t)
                queueTask.tail += 1
                
                print("牌桌上的牌 \(queueTask.data)")
            }
            
            t = q2.data[q2.head]
            print("q2出牌 \(t)")
            if queueTask.data.contains(t) {
                
                print("q2出的牌，牌桌上有，开始收牌")
                q2.head += 1
                q2.data.append(t)
                q2.tail += 1
                
                var last = queueTask.data[queueTask.tail - 1]
                while last != t {
                    print("q2 将桌子上的\(t)放入在自己的手里最后一位")
                    q1.data.append(last)
                    queueTask.data.remove(at: queueTask.tail - 1)
                    
                    queueTask.tail -= 1
                    last = queueTask.data[queueTask.tail - 1]
                }
                
                print("q2 将桌子上的\(t)放入在自己的手里最后一位")
                q1.data.append(last)
                queueTask.data.remove(at: queueTask.tail - 1)
                
                queueTask.tail -= 1
            }else{
                
                print("q2出的牌，牌桌上没有")
                
                q2.head += 1
                
                // 桌上的牌加一
                queueTask.data.append(t)
                queueTask.tail += 1
                
                print("牌桌上的牌 \(queueTask.data)")
            }
        }
        
        if q1.head == q1.tail {
            print("q2获胜")
        }else{
            print("q1获胜")
        }
        
        
        
    }
    
    /// 判断是否是回文
    func checkIsHuiWen(string : String){
    
        let mid = Int(ceil(Double(string.characters.count) / 2.0))  - 1
        
        print(string.characters.count)
        
        print(mid)
        
        var array = [String]()
        
        for i in 0..<mid {
            
            let range = Range(uncheckedBounds: (lower: string.index(string.startIndex, offsetBy: i), upper: string.index(string.startIndex, offsetBy: i+1)))
            
            let charString = string.substring(with: range)
            
            print(charString)
            
            array.append(charString)
        }
        
        
        
        for i in (mid+1..<string.characters.count).reversed(){
            
            let range = Range(uncheckedBounds: (lower: string.index(string.startIndex, offsetBy: i), upper: string.index(string.startIndex, offsetBy: i+1)))
            
            let valueRight = string.substring(with: range)
        
            let valueLeft = array[string.characters.count - i - 1]
            
            let result = valueLeft.compare(valueRight)
            
            if result == .orderedSame {
                
                continue
            }else{
            
                print("不是回文")
                break
            }
        }
        
    }
    
    /// 结构体获取Q号码
    func getQQNumberQueue(){
    
        var q = queue()
        
        q.head = 1
        
        var array = [ 6, 1, 5, 9, 4, 7, 2, 8, 3 ]
        for i in 0...30 {
            if array.count > i {
                q.data.append(array[i])
            }else{
                q.data.append(0)
            }
        }
        
        q.tail = array.count
        
        while q.head < q.tail {
            print(q.data[q.head])
            
            q.head += 1
            
            q.data[q.tail] = q.data[q.head]
            
            q.tail += 1
            q.head += 1
        }
        
        
    }
    
    
    /// 获取Q号码
    func getQQNumber(){
        
        // 原始号码为这个
        // 6 1 5 9 4 7 2 8 3

        var array = [ 6, 1, 5, 9, 4, 7, 2, 8, 3 ]
        
        var arrayTag = [Int]()
        for i in 0...30 {
            if array.count > i {
                arrayTag.append(array[i])
            }else{
                arrayTag.append(0)
            }
        }
        
        var head = 0
        var tail = array.count
        
        while head < tail {
            
            print(arrayTag[head])
            head += 1
            
            arrayTag[tail] = arrayTag[head]
            
            tail += 1
            
            head += 1
        }
        
        print(array)
        
        
    }
    
    /// 快速排序
    ///
    /// - Parameters:
    ///   - left: 左边的索引
    ///   - right: 右边的索引
    func quickSort(_ left: Int, _ right: Int){
        if left > right {
            return
        }
        
        let temp = arrayQuick[left]     // 基准数
        
        var i = left
        var j = right
        
        while i != j {
            
            // 1, 从右向左找第一个比基准数大的数  并且还不能相遇
            while arrayQuick[j] >= temp && i < j {
                j -= 1
            }
            
            // 2, 从左向右找第一个比基准数小的数，并且还不能相遇
            while arrayQuick[i] <= temp && i < j {
                i += 1
            }
            
            // 3, 找到后，开始交换两个数
            if i < j {
                let t = arrayQuick[i]
                arrayQuick[i] = arrayQuick[j]
                arrayQuick[j] = t
            }
        }
        
        // 4, 这是跑了一趟了，将位于第一位基准数放在中间
        arrayQuick[left] = arrayQuick[i]
        arrayQuick[i] = temp
        
        // 5， 分成两部分开始递归
        quickSort(left, i - 1)
        quickSort(i + 1, right)
    }
    
    
    /// 冒泡排序
    func bubbeSort(){
    
        var array = [ 4, 2, 1, 3, 6, 9, 0]
        for i in 0..<array.count{
            for j in i..<array.count{
                if array[i] > array[j] {
                    let tag = array[j]
                    array[j] = array[i];
                    array[i] = tag;
                }
            }
        }
        print(array)
    }
    
    
    
    /// 通排序
    func tongSort(){
        
        let array = [ 5, 4, 2, 1, 6, 8]
        
        var array1 = [Int]()
        for _ in 0...10 {
            array1.append(0)
        }

        for i in array {
            
            array1[i] += 1
        }
        
        print(array1)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
}



