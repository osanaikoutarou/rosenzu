//
//  Station.swift
//  RandomCollectionView
//
//  Created by osanai on 2018/09/21.
//  Copyright © 2018年 osanai.sample.copytesting. All rights reserved.
//

import Foundation
import UIKit

class Station {
    var code:Int = 0
    var lineCode:Int = 0
    var location:(lon:Double,lat:Double) = (0,0)
    var name:String = ""
    
    static func create(dictionary:[String:Any]) -> Station{
        let station = Station()
        station.code = dictionary["station_cd"] as! Int
        station.lineCode = dictionary["line_cd"] as! Int
        station.location = (dictionary["lon"], dictionary["lat"]) as! (lon: Double, lat: Double)
        station.name = dictionary["station_name"] as! String
        return station
    }
    
    func description() {
        print("code:\(code)  location:\(location)  name:\(name)")
    }
    
    var line:Rosen? {
        return JsonLoader.shared.rosenData.filter { $0.code == self.lineCode }.first
    }
    func lineColor() -> UIColor {
        if let line = line {
            return line.lineColor
        }
        return .gray
    }
}
