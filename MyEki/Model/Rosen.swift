//
//  Rosen.swift
//  MyEki
//
//  Created by osanai on 2018/09/27.
//  Copyright © 2018年 osanai.sample.copytesting. All rights reserved.
//

import UIKit

class Rosen: NSObject {
    
    var code:String = ""
    var companyCode:String = ""
    var name:String = ""
    
    var stationCodes:[String] = []
    
    static func create(dictionary:[String:Any]) -> Rosen {
        let obj = Rosen()
        obj.code = dictionary["line_cd"] as! String
        obj.companyCode = dictionary["company_cd"] as! String
        obj.name = dictionary["line_name"] as! String
        return obj
    }
    
    func description() {
        print("code:\(code)  companyCode:\(companyCode)  name:\(name)")
    }
}
