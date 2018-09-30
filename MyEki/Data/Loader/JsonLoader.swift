//
//  JsonLoader.swift
//  RandomCollectionView
//
//  Created by osanai on 2018/09/21.
//  Copyright © 2018年 osanai.sample.copytesting. All rights reserved.
//

import UIKit

class JsonLoader: NSObject {
    
    static let shared = JsonLoader()
    
    var rosenData:[Rosen] = []
    var stationData:[Station] = []
    var companyData:[Company] = []
    
    func loadAll() {
        stationData = JsonLoader.loadStations()!
        rosenData = JsonLoader.loadRosen()!
        companyData = JsonLoader.loadCompany()!
    }

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
        var result:[Station] = []
        
        let jsonResult = load(resourceName: "StationData")
        
        if let jsonResult = jsonResult as? [[String:Any]] {
            jsonResult.forEach { (data:[String:Any]) in
                let station = Station.create(dictionary: data)
                result.append(station)
                
                station.description()
            }
            
            return result
        }
        return []
    }
    
    static func loadRosen() -> [Rosen]? {
        var result:[Rosen] = []
        
        let jsonResult = load(resourceName: "RosenData")
        
        if let jsonResult = jsonResult as? [[String:Any]] {
            jsonResult.forEach { (data:[String:Any]) in
                let rosen = Rosen.create(dictionary: data)
                result.append(rosen)
                
                rosen.description()
            }
            return result
        }
        return []
    }
    
    static func loadCompany() -> [Company]? {
        var result:[Company] = []
        
        let jsonResult = load(resourceName: "CompanyData")
        
        if let jsonResult = jsonResult as? [[String:Any]] {
            jsonResult.forEach { (data:[String:Any]) in
                let company = Company.create(dictionary: data)
                result.append(company)
                
                company.description()
            }
            return result
        }
        return []
    }
    
    static func loadMyRosen() -> [MyRosen]? {
        var result:[MyRosen] = []
        
        let jsonResult = load(resourceName: "MyEkiData")
        
        if let jsonResult = jsonResult as? [[String:Any]] {
            jsonResult.forEach { (data:[String:Any]) in
                let myrosen = MyRosen.create(dictionary: data)
                result.append(myrosen)
            }
            return result
        }
        return []
    }
    
}
