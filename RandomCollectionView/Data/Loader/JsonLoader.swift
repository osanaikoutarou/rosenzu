//
//  JsonLoader.swift
//  RandomCollectionView
//
//  Created by osanai on 2018/09/21.
//  Copyright © 2018年 osanai.sample.copytesting. All rights reserved.
//

import UIKit

class JsonLoader: NSObject {

    static func loadRosen() -> [Station]? {
        let filepath = Bundle.main.url(forResource: "RosenData", withExtension: "json")
        if let filepath = filepath {
            do {
                let data = try Data(contentsOf: filepath)
                let jsonResult = try! JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                if let jsonResult = jsonResult as? Dictionary<String, Any> {
                    
                    if let array = jsonResult["銀座線"] as? [Dictionary<String, Any>] {
                        let stations = array.map { Station.create(dictionary: $0) }

                        stations.forEach { $0.description() }
                        
                        return stations
                    }
                }
            } catch {
                print("error")
            }
        }
        return nil
    }
}
