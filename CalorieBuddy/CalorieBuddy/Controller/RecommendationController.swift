//
//  RecommendationController.swift
//  CalorieBuddy
//
//  Created by Sibusiso Mbonani on 2022/10/05.
//

import UIKit

class RecommendationController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let categories = ["Pasta", "Pizza", "Fish", "Chicken", "Meat", "Salad"]
    let subTitle = ["12 Receps", "32 Receps", "78 Receps", "13 Receps", "45 Receps", "54 Receps"]
    let images = ["pasta.png", "pizza.png", "fish.png", "chicken.png", "steak.png", "salad.png"]
    let dp = DataProvider()
    var categoryTitle: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.collectionViewLayout = createLayout()
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        // Item
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1)))

        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 1, bottom: 5, trailing: 1)

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
        
        let item = categories[indexPath.row]
        let subTitleItem = subTitle[indexPath.row]
        let image = images[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "foodCell", for: indexPath) as! BodyCollectionViewCell
        cell.setUpView()
        cell.setUpContent(title: item, subTitle: subTitleItem)
        cell.foodImage.image = UIImage(named: image)
            return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        categoryTitle = categories[indexPath.row]
        print(categoryTitle)
        performSegue(withIdentifier: "RecommendedDetailController", sender: self)

        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? RecommendedDetailController {
            destination.categoryTitle = categoryTitle
        }
    }
}
