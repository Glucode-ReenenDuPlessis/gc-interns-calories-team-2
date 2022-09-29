//
//  RecommendedViewController.swift
//  CalorieBuddy
//
//  Created by Sibusiso Mbonani on 2022/09/29.
//

import UIKit

class RecommendedViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    let array = ["Asian", "Traditional Indonesian", "Arabian", "Traditional Japeng", "Pudding", "Bunny Chow"]
    // count of array
    let anotherArray = ["89", "4", "78", "26", "5", "12"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.collectionViewLayout = createLayout()
//        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "collectionViewCell")
        print(array)
        print(anotherArray)
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        // item - two cells per row
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1)))
        
        item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        
        // Group
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(300)), repeatingSubitem: item, count: 2)
        
        // Section
        let section = NSCollectionLayoutSection(group: group)
        
        // return
        return UICollectionViewCompositionalLayout(section: section)
    }
}

extension RecommendedViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = array[indexPath.row]
        let subItem = anotherArray[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! RecommendedCollectionViewCell
        cell.setUpView()
        cell.setUpContent(title: item, subTitle: subItem)
        return cell
    }
}
