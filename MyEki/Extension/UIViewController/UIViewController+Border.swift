//
//  UIViewController+Border.swift
//  EventWorks
//
//  Created by osanai on 2018/04/19.
//  Copyright © 2018年 osanai.sample.eventworks. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

// SnapKit前提
// https://github.com/SnapKit/SnapKit

extension UIViewController {
    enum BorderSideType {
        case left
        case right
        case top
        case bottom
    }
    
    func addBorder(targetView:UIView,
                   borderColor:UIColor,
                   borderWidth:CGFloat,
                   sides:[BorderSideType]) {

        addBorder(targetView: targetView,
                  borderColor: borderColor,
                  borderWidth: borderWidth,
                  lengthRatio:1.0,
                  sides: sides)
    }
    
    func addBorder(targetView:UIView,
                   borderColor:UIColor,
                   borderWidth:CGFloat,
                   lengthRatio:CGFloat,
                   sides:[BorderSideType]) {
        
        if sides.contains(.left) {
            let border = UIView()
            border.backgroundColor = borderColor
            targetView.addSubview(border)
            border.snp.makeConstraints { (make) -> Void in
                make.width.equalTo(borderWidth)
                make.centerY.equalToSuperview()
                make.height.equalTo(targetView.snp.height).multipliedBy(lengthRatio)
                make.left.equalTo(0)
            }
        }
        if sides.contains(.right) {
            let border = UIView()
            border.backgroundColor = borderColor
            targetView.addSubview(border)
            border.snp.makeConstraints { (make) -> Void in
                make.width.equalTo(borderWidth)
                make.centerY.equalToSuperview()
                make.height.equalTo(targetView.snp.height).multipliedBy(lengthRatio)
                make.right.equalTo(0)
            }
        }
        if sides.contains(.top) {
            let border = UIView()
            border.backgroundColor = borderColor
            targetView.addSubview(border)
            border.snp.makeConstraints { (make) -> Void in
                make.height.equalTo(borderWidth)
                make.centerX.equalToSuperview()
                make.width.equalTo(targetView.snp.width).multipliedBy(lengthRatio)
                make.top.equalTo(0)
            }
        }
        if sides.contains(.bottom) {
            let border = UIView()
            border.backgroundColor = borderColor
            targetView.addSubview(border)
            border.snp.makeConstraints { (make) -> Void in
                make.height.equalTo(borderWidth)
                make.centerX.equalToSuperview()
                make.width.equalTo(targetView.snp.width).multipliedBy(lengthRatio)
                make.bottom.equalTo(0)
            }
        }
    }
}
