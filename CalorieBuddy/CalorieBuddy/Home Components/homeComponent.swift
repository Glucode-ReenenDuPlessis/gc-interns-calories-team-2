//
//  homeComponent.swift
//  CalorieBuddy
//
//  Created by Bronson van den Broeck on 2022/09/28.
//

import UIKit
class homeComponent: UIView {
    @IBOutlet weak var imageView: UIImageView!
    private var shadowLayer: CAShapeLayer?
    
    private func createShadow() {
        self.layer.cornerRadius = 25
        self.layer.masksToBounds = true

            layer.shadowColor = UIColor.black.cgColor
            layer.shadowPath = shadowLayer?.path
            layer.shadowOpacity = 0.5
            layer.shadowRadius = 10
            layer.shouldRasterize = true
            layer.rasterizationScale = UIScreen.main.scale
        
        layer.masksToBounds = false
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        createShadow()
        imageView.layer.cornerRadius = 25
        imageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
}


