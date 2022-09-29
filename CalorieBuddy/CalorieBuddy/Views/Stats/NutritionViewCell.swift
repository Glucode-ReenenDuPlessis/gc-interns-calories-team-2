//
//  NutritionViewCell.swift
//  CalorieBuddy
//
//  Created by Pat on 2022/09/29.
//

import UIKit

class NutritionViewCell: UICollectionViewCell {
    let shapeLayer = CAShapeLayer()
    //track layer
    let trackLayer = CAShapeLayer()
    
    let greenView: UIView = {
       let view = UIView()
        view.backgroundColor = .systemOrange
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let redView: UIView = {
       let view = UIView()
        view.backgroundColor = .systemRed
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupProgressBar()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didAddSubview(_ subview: UIView) {
        super.didAddSubview(subview)
        
    }
    func setupViews(){
        addSubview(greenView)
        addSubview(redView)
        
        NSLayoutConstraint.activate([
            greenView.leadingAnchor.constraint(equalTo: leadingAnchor),
            greenView.trailingAnchor.constraint(equalTo: redView.leadingAnchor),
            greenView.topAnchor.constraint(equalTo: topAnchor),
            greenView.bottomAnchor.constraint(equalTo: bottomAnchor),
            greenView.widthAnchor.constraint(equalToConstant: 150),
            
            redView.leadingAnchor.constraint(equalTo: greenView.trailingAnchor),
            redView.trailingAnchor.constraint(equalTo: trailingAnchor),
            redView.bottomAnchor.constraint(equalTo: bottomAnchor),
            redView.topAnchor.constraint(equalTo: topAnchor)
        ])
    }
    
    func setupProgressBar(){
      
        
        let center = greenView.center
        let circularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -CGFloat.pi/2, endAngle: CGFloat.pi*2, clockwise: true)
        trackLayer.path = circularPath.cgPath
        
        //add stroke to the circle
        trackLayer.strokeColor = UIColor.lightGray.cgColor
        trackLayer.lineWidth = 10
        trackLayer.fillColor = UIColor.clear.cgColor
        //line cap
        greenView.layer.addSublayer(trackLayer)

        
        //path needed to draw the shape layer (for shape layer)
        shapeLayer.path = circularPath.cgPath
        
        //add stroke to the circle
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.strokeEnd = 0
        shapeLayer.fillColor = UIColor.clear.cgColor
        //line cap
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        
        
        greenView.layer.addSublayer(shapeLayer)
        
        
        
        
        
        //tap gesture
        greenView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }
    //tap gesture function
    @objc
    func handleTap(){
        //key path is the thing you want to animate
        //using it animate the key path
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.duration = 2
        basicAnimation.toValue = 0.6
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false
        shapeLayer.add(basicAnimation, forKey: "basicAnim")
    }
    
    
}
