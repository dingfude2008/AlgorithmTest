//
//  VC01.swift
//  算法Test
//
//  Created by DFD on 2017/4/27.
//  Copyright © 2017年 DFD. All rights reserved.
//

import UIKit



class VC01: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        tongSort()
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



