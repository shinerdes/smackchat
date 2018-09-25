//
//  CircleImage.swift
//  Smack
//
//  Created by 김영석 on 2018. 9. 25..
//  Copyright © 2018년 김영석. All rights reserved.
//

import UIKit


@IBDesignable
class CircleImage: UIImageView {

    override func awakeFromNib() {
        setupView()
    }
    
    func setupView() {
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
        
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
}
