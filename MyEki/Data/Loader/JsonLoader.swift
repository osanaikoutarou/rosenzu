//
//  JsonLoader.swift
//  RandomCollectionView
//
//  Created by osanai on 2018/09/21.
//  Copyright © 2018年 osanai.sample.copytesting. All rights reserved.
//

import UIKit

class JsonLoader: NSObject {
    
    var rosenData:[Rosen] = []
    var stationData:[Station] = []
    var companyData:[Company] = []

    static func load(resourceName:String) -> Any? {
        let filepath = Bundle.main.url(forResource: resourceName, withExtension: "json")
        if let filepath = filepath {
            do {
                let data = try Data(contentsOf: filepath)
                let jsonResult = try! JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                return jsonResult
            } catch {
                print("error")
            }
        }
        return nil
    }
    
    static func loadStations() -> [Station]? {
        let jsonResult = load(resourceName: "StationData")
//        print(jsonResult!)
        
        if let jsonResult = jsonResult as? [[String:Any]] {
            jsonResult.forEach { (data:[String:Any]) in
                let station = Station.create(dictionary: data)
                
                station.description()
            }
        }
        
        return []
    }
    
}
