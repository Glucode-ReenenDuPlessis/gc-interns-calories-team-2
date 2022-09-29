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
    fileprivate let padding: CGFloat = 16
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.showsVerticalScrollIndicator = false
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.register(DatePickerViewCell.self, forCellWithReuseIdentifier: collectionId)
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
//        BGView.frame = CGRect(x: 0, y: 0, width: 400, height: 300)
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
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
 
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionId, for: indexPath)
            
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

