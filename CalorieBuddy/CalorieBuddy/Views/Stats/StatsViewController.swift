//
//  StatsViewController.swift
//  CalorieBuddy
//
//  Created by Pat on 2022/09/28.
//

import Foundation

import SwiftUI

class StatsViewController: UICollectionViewController ,UICollectionViewDelegateFlowLayout{
    fileprivate let cellId = "cellId"
    fileprivate let collectionId = "collectionId"
    fileprivate let nuttritionId = "nuttritionId"
    fileprivate let padding: CGFloat = 16
    
    let shapeLayer = CAShapeLayer()
    //track layer
    let trackLayer = CAShapeLayer()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        setupBackgroundView()
    }
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        super.init(collectionViewLayout: layout)
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupBackgroundView(){
        let BGView = UIView()
        BGView.translatesAutoresizingMaskIntoConstraints = false
        BGView.backgroundColor = .secondarySystemFill
        BGView.layer.cornerRadius = 20
        BGView.layer.shadowColor = UIColor.black.cgColor
        BGView.layer.shadowOpacity = 1
        BGView.layer.shadowOffset = .init(width: 1, height: 2)
        BGView.layer.shadowRadius = 0.5
        collectionView.addSubview(BGView)
        BGView.layer.zPosition = -1

        BGView.isUserInteractionEnabled = false
        
        
        NSLayoutConstraint.activate([
            BGView.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor,constant: 5),
            BGView.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor),
            BGView.topAnchor.constraint(equalTo: collectionView.topAnchor,constant: 10),
            BGView.heightAnchor.constraint(equalToConstant: 120),
            BGView.widthAnchor.constraint(equalTo: collectionView.widthAnchor,constant: -10)
        
        ])
    }
     
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        trackLayer.frame = .init(x: 100, y: 110, width: 20, height: 20)
        shapeLayer.frame = .init(x: 100, y: 110, width: 20, height: 20)
    }
}

// collection view set up
extension StatsViewController{
    func configureCollectionView(){
        view.backgroundColor = .white
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(DatePickerViewCell.self, forCellWithReuseIdentifier: collectionId)
        collectionView.register(NutritionViewCell.self, forCellWithReuseIdentifier: nuttritionId)
        setupProgressBar()
    }
    
    func setupProgressBar(){
      
        
        let center = collectionView.center
        let circularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -CGFloat.pi/2, endAngle: CGFloat.pi*2, clockwise: true)
        trackLayer.path = circularPath.cgPath
        
        //add stroke to the circle
        trackLayer.strokeColor = UIColor.lightGray.cgColor
        trackLayer.lineWidth = 10
        trackLayer.fillColor = UIColor.clear.cgColor
        //line cap
        

        
        //path needed to draw the shape layer (for shape layer)
        shapeLayer.path = circularPath.cgPath
        
        //add stroke to the circle
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.strokeEnd = 0
        shapeLayer.fillColor = UIColor.clear.cgColor
        //line cap
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        
        
        
        
        
        
        
        
        //tap gesture
//        greenView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
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
 

struct ViewController_Previews: PreviewProvider {
    static var previews: some View {
        Container().edgesIgnoringSafeArea(.all)
    }
    
    struct Container: UIViewControllerRepresentable {
        
        func makeUIViewController(context: Context) -> UIViewController {
            StatsViewController()
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        }
        
        typealias UIViewControllerType = UIViewController
        
    }
}

//collection view controls
extension StatsViewController{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionId, for: indexPath)
            return cell
        }else if indexPath.item == 1{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
            cell.layer.addSublayer(trackLayer)
            cell.layer.addSublayer(shapeLayer)
            cell.layer.cornerRadius = 20
            cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
            cell.backgroundColor = .black
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item == 0{
            return .init(width: view.frame.width - 2 * padding, height: 150)
        }else if indexPath.item == 1{
            return .init(width: view.frame.width - 2 * padding, height: 250)
        }else{
            return .init(width: view.frame.width - 2 * padding, height: 100)
        }
    }
}
