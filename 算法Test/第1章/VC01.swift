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

        getQQNumber()
        
        
//        quickSort(0, arrayQuick.count - 1)
//        
//        print(arrayQuick)
        
//        bubbeSort()
        
        //tongSort()
        
    }
    
    func getQQNumberQueue(){
    
        let q = queue()
        
        
        
    }
    
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



