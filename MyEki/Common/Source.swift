//
//  Source.swift
//  MyEki
//
//  Created by 長内幸太郎 on 2018/09/30.
//  Copyright © 2018年 osanai.sample.copytesting. All rights reserved.
//

import UIKit

class Source: NSObject {
    static let shared = Source()
    var rosens:[Rosen] = []
    var stations:[Station] = []     // 必要な分

    func setup() {
        let myrosens = JsonLoader.loadMyRosen()!
        
        // 必要な分だけ抽出
        myrosens.forEach { (myrosen) in
            let filtered = JsonLoader.shared.rosenData.filter { $0.code == myrosen.code }
            if let rosen = filtered.first {
                rosen.lineDispname = myrosen.lineDispname
                rosen.lineColor = myrosen.lineColor
                
                rosens.append(rosen)
            }
        }
        
        // 必要な分だけ抽出
        rosens.forEach { (rosen) in
            let filtered = JsonLoader.shared.stationData.filter { $0.lineCode == rosen.code }
            filtered.forEach({ (station) in
                if (!stations.contains(where: { (s) -> Bool in s.code == station.code })) {
                    stations.append(station)
                }
            })
        }
        
        print(rosens)
        print(stations)
    }
    
}
