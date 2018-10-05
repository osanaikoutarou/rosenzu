//
//  StationListTableViewCell.swift
//  MyEki
//
//  Created by 長内幸太郎 on 2018/10/05.
//  Copyright © 2018年 osanai.sample.copytesting. All rights reserved.
//

import UIKit

class StationListTableViewCell: UITableViewCell {

    @IBOutlet weak var stationNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
