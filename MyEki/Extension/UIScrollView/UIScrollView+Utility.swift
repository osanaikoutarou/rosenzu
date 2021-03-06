//
//  UIScrollView+Utility.swift
//  EventWorks
//
//  Created by osanai on 2018/09/13.
//  Copyright © 2018年 osanai.sample.eventworks. All rights reserved.
//

import Foundation
import UIKit

extension UIScrollView {
    func isBottom(toleranceHeight:CGFloat) -> Bool {
        return contentOffset.y > contentSize.height - frame.height + contentInset.bottom - toleranceHeight
    }
    
    func isNeedScroll() -> Bool {
        return (contentSize.width > self.width) ||
               (contentSize.height > self.height)
    }
    
    func scrollToBottom(animation:Bool) {
        scrollToBottom(offset: 0, animation: animation)
    }
    func scrollToBottom(offset:CGFloat,animation:Bool) {
        UIView.animate(withDuration: animation ? 0.25 : 0) {
            self.contentOffset = CGPoint(x: self.contentOffset.x,
                                         y: self.contentSize.height - self.frame.size.height + self.contentInset.bottom + offset)
        }
    }
}
