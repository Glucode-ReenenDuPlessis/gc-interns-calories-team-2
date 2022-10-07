//
//  RecommendationController.swift
//  CalorieBuddy
//
//  Created by Sibusiso Mbonani on 2022/10/05.
//

import UIKit

class RecommendationController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let categories = ["Asian", "Traditional Tai", "Japanese", "Korean", "Indian", "African"]

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.collectionViewLayout = createLayout()
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        // Item
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1)))

        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)

                // Group
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.4)), repeatingSubitem: item, count: 2)

                // Section
        let section = NSCollectionLayoutSection(group: group)

                // return
        return  UICollectionViewCompositionalLayout(section: section)
    }

}

extension RecommendationController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "foodCell", for: indexPath) as! BodyCollectionViewCell
            cell.setUpContent()
            return cell
    }
}
