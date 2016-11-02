//
//  touchesBegan.swift
//  ButtonTest
//
//  Created by William Chung on 2016-11-01.
//  Copyright © 2016 William Chung. All rights reserved.
//

import UIKit

class newTouch: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.location(in: self)
            print(position.x)
            print(position.y)
        }
    }
    
}
