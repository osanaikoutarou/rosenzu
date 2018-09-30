//
//  Rosen.swift
//  MyEki
//
//  Created by osanai on 2018/09/27.
//  Copyright © 2018年 osanai.sample.copytesting. All rights reserved.
//

import UIKit

class Rosen: NSObject {
    
    var code:Int = 0
    var companyCode:Int = 0
    var name:String = ""
    var lineDispname:String = ""
    var lineColor:UIColor = .black
    
    var stationCodes:[String] = []
    
    static func create(dictionary:[String:Any]) -> Rosen {
        let obj = Rosen()
        obj.code = dictionary["line_cd"] as! Int
        obj.companyCode = dictionary["company_cd"] as! Int
        obj.name = dictionary["line_name"] as! String
        return obj
    }
    
    func description() {
        print("code:\(code)  companyCode:\(companyCode)  name:\(name)")
    }
}
