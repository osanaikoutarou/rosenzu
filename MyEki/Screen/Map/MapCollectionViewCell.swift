//
//  StationCollectionViewCell.swift
//  StationCollectionView
//
//  Created by osanai on 2018/09/20.
//  Copyright © 2018年 osanai.sample.copytesting. All rights reserved.
//

import UIKit

class StationCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var childView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        childView.backgroundColor = .white
        
        parentView.circle()
        childView.circle()
    }
    
    func setup(_ station:Station) {
        titleLabel.text = String(station.name)
        parentView.backgroundColor = station.lineColor()
    }
}
