//
//  NutritionViewCell.swift
//  CalorieBuddy
//
//  Created by Pat on 2022/09/29.
//

import UIKit

class NutritionViewCell: UICollectionViewCell {
    //tracks
    let shapeLayer = CAShapeLayer()
    let trackLayer = CAShapeLayer()
    
    var startValue:Double = 0
    var endValue:Double = 60
    
    //keep track of when the animation started and animation duration
    let animationStartDate = Date()
    let animationDuration: Double = 1.5
    
    let greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let redView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray.withAlphaComponent(0.3)
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var calText: UILabel = {
        var text = UILabel()
        var attributedText = NSMutableAttributedString(string: "Total Calories",attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .medium)])
        text.attributedText = attributedText
        text.textColor = .black
        text.layer.cornerRadius = 20
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textAlignment = .left
        return text
    }()
    var calAmnt: UILabel = {
        var text = UILabel()
        var attributedText = NSMutableAttributedString(string: "200",attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25, weight: .bold)])
        text.attributedText = attributedText
        text.textColor = .secondaryLabel
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    var nutritionPer: UILabel = {
        var text = UILabel()
        var attributedText = NSMutableAttributedString(string: "Tap",attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 30)])
        text.attributedText = attributedText
        text.textColor = .secondaryLabel
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textAlignment = .center
        return text
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupProgressBar()
        shapeLayer.frame = .init(x: 75, y: 120, width: 100, height: 100)
        trackLayer.frame = .init(x: 75, y: 120, width: 100, height: 100)
     
   
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        addSubview(greenView)
        addSubview(redView)
        redView.addSubview(calText)
        redView.addSubview(calAmnt)
        greenView.addSubview(nutritionPer)
        
        NSLayoutConstraint.activate([
            greenView.leadingAnchor.constraint(equalTo: leadingAnchor),
            greenView.trailingAnchor.constraint(equalTo: redView.leadingAnchor),
            greenView.topAnchor.constraint(equalTo: topAnchor),
            greenView.bottomAnchor.constraint(equalTo: bottomAnchor),
            greenView.widthAnchor.constraint(equalToConstant: 150),
            
            redView.leadingAnchor.constraint(equalTo: greenView.trailingAnchor),
            redView.trailingAnchor.constraint(equalTo: trailingAnchor),
            redView.bottomAnchor.constraint(equalTo: bottomAnchor),
            redView.topAnchor.constraint(equalTo: topAnchor),
            
            calText.leadingAnchor.constraint(equalTo: redView.leadingAnchor,constant: 20),
            calText.trailingAnchor.constraint(equalTo: redView.trailingAnchor),
            calText.topAnchor.constraint(equalTo: redView.topAnchor),
            calText.heightAnchor.constraint(equalToConstant: 50),
            
            calAmnt.topAnchor.constraint(equalTo: calText.bottomAnchor),
            calAmnt.leadingAnchor.constraint(equalTo: redView.leadingAnchor,constant: 20),
            calAmnt.trailingAnchor.constraint(equalTo: redView.trailingAnchor),
            
            
            nutritionPer.centerXAnchor.constraint(equalTo: greenView.centerXAnchor),
            nutritionPer.centerYAnchor.constraint(equalTo: greenView.centerYAnchor,constant: -5)
            
            
        ])
        
     
    }
    
    func setupProgressBar(){
        
        
        let center = greenView.center
        let circularPath = UIBezierPath(arcCenter: center, radius: 60, startAngle: -CGFloat.pi/2, endAngle: CGFloat.pi*2, clockwise: true)
        trackLayer.path = circularPath.cgPath
        
        //add stroke to the circle
        trackLayer.strokeColor = UIColor.label.withAlphaComponent(0.2).cgColor
        trackLayer.lineWidth = 10
        trackLayer.fillColor = UIColor.clear.cgColor
        
        //line cap
        greenView.layer.addSublayer(trackLayer)
        
        
        //path needed to draw the shape layer (for shape layer)
        shapeLayer.path = circularPath.cgPath
        
        //add stroke to the circle
        shapeLayer.strokeColor = UIColor.systemYellow.cgColor
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
        basicAnimation.toValue = endValue/100
        
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false
        shapeLayer.add(basicAnimation, forKey: "basicAnim")
        let displayLink = CADisplayLink(target: self, selector: #selector(handleUpdate))
        displayLink.add(to: .main, forMode: .default)
        handleUpdate()
    }
    
    @objc
    func handleUpdate(){
        let now = Date()
        let elapsedTime = now.timeIntervalSince(animationStartDate)
        
//
//        if elapsedTime > animationDuration {
//            self.nutritionPer.text = "\(endValue)"
//        }else{
//            let percentage = elapsedTime / animationDuration
//            let value = percentage * (endValue - startValue)
//            self.nutritionPer.text = "\(value)"
//        }
            
        
        //can also be used to have a live date
        //print(Date())
        
        self.nutritionPer.text = "\(String(format: "%.0f", startValue))%"
        startValue += 1
        if startValue > endValue {
            startValue = endValue
        }
        
        
        
    }
    
}
