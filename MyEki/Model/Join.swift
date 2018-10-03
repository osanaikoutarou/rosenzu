//
//  Join.swift
//  MyEki
//
//  Created by 長内幸太郎 on 2018/10/03.
//  Copyright © 2018年 osanai.sample.copytesting. All rights reserved.
//

import UIKit

class Join: NSObject {
    var lineCode:Int = 0
    var stationCodes:(s1:Int,s2:Int) = (0,0)
    
    static func create(dictionary:[String:Any]) -> Join {
        let obj = Join()
        obj.lineCode = dictionary["line_cd"] as! Int
        obj.stationCodes = (dictionary["station_cd1"],dictionary["station_cd2"]) as! (Int,Int)
        return obj
    }

}
