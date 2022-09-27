////
////  RecommenedViewController.swift
////  SampleAPICall
////
////  Created by Pat on 2022/09/21.
////
//
//import UIKit
//
//class RecommenedViewController: UIViewController {
//    let dp = DataProvider()
//    static let categoryHeaderId = "categoryHeaderId"
//    let headerId = "headerId"
//    @IBOutlet var collectionView: UICollectionView!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        collectionView.collectionViewLayout = ConfigureCollectionView()
//        collectionView.register(TitleSupplementaryView.self, forSupplementaryViewOfKind: RecommenedViewController.categoryHeaderId, withReuseIdentifier: headerId)
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        dp.parseJSON(getFood: "pasta") {
//            self.collectionView.reloadData()
//        }
//    }
//
//}
//
//
//
//extension RecommenedViewController: UICollectionViewDelegate,UICollectionViewDataSource{
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        2
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        switch section{
//        case 0:
//            return 10
//        case 1:
//            return 4
//        default:
//            return 0
//        }
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let food = dp.foods?.hints[indexPath.row]
//        switch indexPath.section{
//        case 0:
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BaseCollectionViewCell", for: indexPath) as! BaseCollectionViewCell
//            cell.configureView(img: food?.food.image)
//            return cell
//        case 1:
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlanCollectionViewCell", for: indexPath) as! PlanCollectionViewCell
//            cell.configureCell(text: "Weight", img: "square.text.square.fill")
//            return cell
//        default:
//            return UICollectionViewCell()
//        }
//
//    }
//}
//
//extension RecommenedViewController{
//    func ConfigureCollectionView() -> UICollectionViewCompositionalLayout{
//        return UICollectionViewCompositionalLayout {(sectionNumber, env) -> NSCollectionLayoutSection? in
//            if sectionNumber == 0 {
//                //Item
//                let item  = CompositionalLayout.createItem(w: .fractionalWidth(0.4), h: .fractionalHeight(1), spacing: 1 )
//                let maxItem  = CompositionalLayout.createItem(w: .fractionalWidth(1), h: .fractionalHeight(1), spacing: 1 )
//                let verticalGroup = CompositionalLayout.createGroup(alignment: .vertical, w: .fractionalWidth(0.3), h: .fractionalHeight(1), item: maxItem, count: 2)
//                //Group
//                let group = CompositionalLayout.createGroup(alignment: .hortizontal, w: .fractionalWidth(1), h: .fractionalHeight(0.3), items: [verticalGroup,verticalGroup, item])
//                //Section
//                let section  = NSCollectionLayoutSection(group: group)
//                //Return
//                return section
//            }
//            else{
//                let item  = CompositionalLayout.createItem(w: .fractionalWidth(1), h: .fractionalHeight(1), spacing: 1 )
//                let group  = CompositionalLayout.createGroup(alignment: .hortizontal, w: .fractionalWidth(1), h: .fractionalHeight(0.3), item: item, count: 2)
//                let section  = NSCollectionLayoutSection(group: group)
//                section.boundarySupplementaryItems = [
//                    .init(layoutSize: .init(widthDimension: .absolute(200), heightDimension: .absolute(20)), elementKind: RecommenedViewController.categoryHeaderId, alignment: .topLeading)
//                ]
//                return section
//            }
//        }
//    }
//}
//
//final class TitleSupplementaryView: UICollectionReusableView{
//    static let reuseIdentifier = String(describing: TitleSupplementaryView.self)
//    let textLabel = UILabel()
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        configure()
//        textLabel.text = "Meal Plans"
//    }
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) is not implemented")
//    }
//
//    private func configure(){
//        addSubview(textLabel)
//        textLabel.font = UIFont.preferredFont(forTextStyle: .title2)
//        textLabel.translatesAutoresizingMaskIntoConstraints = false
//
//        let inset: CGFloat = 10
//
//        NSLayoutConstraint.activate([
//            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: inset),
//            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -inset),
//            textLabel.topAnchor.constraint(equalTo: topAnchor, constant: inset),
//            textLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -inset)
//        ])
//    }
//}
