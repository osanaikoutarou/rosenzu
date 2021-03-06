//
//  Company.swift
//  MyEki
//
//  Created by osanai on 2018/09/27.
//  Copyright © 2018年 osanai.sample.copytesting. All rights reserved.
//

import UIKit

class Company: NSObject {
    
    var code:Int = 0
    var name:String = ""
    
    var stationCodes:[String] = []
    
    static func create(dictionary:[String:Any]) -> Company {
        let obj = Company()
        obj.code = dictionary["company_cd"] as! Int
        obj.name = dictionary["company_name"] as! String
        return obj
    }
    
    func description() {
        print("code:\(code)  name:\(name)")
    }
}
