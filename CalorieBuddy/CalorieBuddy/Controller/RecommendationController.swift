//
//  RecommendationController.swift
//  CalorieBuddy
//
//  Created by Sibusiso Mbonani on 2022/10/05.
//

import UIKit

class RecommendationController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let sections = MockData.shared.pageData
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.collectionViewLayout = createLayout()
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, layoutEnvironment in
            guard let self = self else { return }
            let section = self?.sections[sectionIndex]
            
            switch sections {
            case .header:
                return nil
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(50), heightDimension: .absolute(50)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                return section
                
            case .body:
                // Item
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1)))

                item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)

                // Group
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.4)), repeatingSubitem: item, count: 2)

                // Section
                let section = NSCollectionLayoutSection(group: group)

                // return
                return  section
            }
            
//            switch section {
//                case .header:
//                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1)))
//
//                    let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(80), heightDimension: .absolute(50)), repeatingSubitem: [item], count: 1)
//
//
//                    let section = NSCollectionLayoutSection(group: group)
//
//                    return section
//
//                case .body:
//                    return nil
//            }
        }
    }

}

extension RecommendationController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].count    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch sections[indexPath.section] {
        case .header(let items):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "headerCell", for: indexPath) as! HeaderCollectionViewCell
            cell.setUpView(items[indexPath.row])
            return cell

        case .body(let items):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "foodCell", for: indexPath) as! BodyCollectionViewCell
            cell.setUpContent(items[indexPath.row])
            return cell
        }
//        let item = categories[indexPath.row]
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "foodCell", for: indexPath) as! BodyCollectionViewCell
//        cell.setUpContent(<#ListItem#>)
//        return cell
    }
}

//class CollectionViewCell: UICollectionViewCell {
//
//    @IBOutlet weak var foodView: UIView!
//
//    func setUpContent() {
//        foodView.layer.cornerRadius = foodView.frame.size.height / 15
//        foodView.backgroundColor = .cyan
//
//    }
//
//}
