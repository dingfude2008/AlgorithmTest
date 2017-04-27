//
//  Bundle+Extension.swift
//  算法Test
//
//  Created by DFD on 2017/4/27.
//  Copyright © 2017年 DFD. All rights reserved.
//

import Foundation

extension Bundle{
    var namespace : String{
        return infoDictionary?["CFBundleName"] as? String ?? ""
    }
}
