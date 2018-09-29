//
//  RandomCollectionViewCell.swift
//  RandomCollectionView
//
//  Created by osanai on 2018/09/20.
//  Copyright © 2018年 osanai.sample.copytesting. All rights reserved.
//

import UIKit

class RandomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var childView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        parentView.backgroundColor = .orange
        childView.backgroundColor = .white
        
        parentView.circle()
        childView.circle()
    }
}