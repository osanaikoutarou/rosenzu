//
//  MyRosen.swift
//  MyRosen
//
//  Created by 長内幸太郎 on 2018/09/30.
//  Copyright © 2018年 osanai.sample.copytesting. All rights reserved.
//

import UIKit

class MyRosen: NSObject {
    
    var code:Int = 0
    var lineDispname:String = ""
    var lineColor:UIColor = .black
    
    var stationCodes:[String] = []
    
    static func create(dictionary:[String:Any]) -> MyRosen {
        let obj = MyRosen()
        obj.code = dictionary["line_cd"] as! Int
        obj.lineDispname = dictionary["line_dispname"] as! String
        obj.lineColor = UIColor(hex: dictionary["line_color"] as! String)
        
        return obj
    }
    
}
