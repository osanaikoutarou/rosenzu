//
//  Station.swift
//  RandomCollectionView
//
//  Created by osanai on 2018/09/21.
//  Copyright © 2018年 osanai.sample.copytesting. All rights reserved.
//

import Foundation

class Station {
    var id:Int = 0
    var position:(lon:Double,lat:Double) = (0,0)
    var name:String = ""
    
    static func create(dictionary:[String:Any]) -> Station{
        let station = Station()
        station.id = dictionary["station_id"] as! Int
        station.position = (dictionary["lon"], dictionary["lat"]) as! (lon: Double, lat: Double)
        station.name = dictionary["name"] as! String
        return station
    }
    
    func description() {
        print("id:\(id)  position:\(position)  name:\(name)")
    }
}
