//
//  StatsViewController.swift
//  CalorieBuddy
//
//  Created by Pat on 2022/09/28.
//

import Foundation

import SwiftUI

class StatsViewController: UICollectionViewController ,UICollectionViewDelegateFlowLayout, DateSelectionDelagate{
    func didSelectDate(date: Date) {
        selectedDate = date
        collectionView.reloadData()
    }
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    fileprivate let cellId = "cellId"
    fileprivate let baseId = "baseId"
    fileprivate let collectionId = "collectionId"
    fileprivate let foodItemId = "foodItemId"
    fileprivate let nuttritionId = "nuttritionId"
    fileprivate let padding: CGFloat = 16

    let shapeLayer = CAShapeLayer()
    //track layer
    let trackLayer = CAShapeLayer()
    var items = [FoodItem]()
    var selectedDate = Date()
    var totalSquares = [Date]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
//        setupBackgroundView()
        getAllItems()
        collectionView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        collectionView.reloadData()
    }
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        super.init(collectionViewLayout: layout)
        getAllItems()
        
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

    }
}

// collection view set up
extension StatsViewController{
    func configureCollectionView(){
        view.backgroundColor = .white
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(BaseCell.self, forCellWithReuseIdentifier: baseId)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(DatePickerViewCell.self, forCellWithReuseIdentifier: collectionId)
        collectionView.register(NutritionViewCell.self, forCellWithReuseIdentifier: nuttritionId)
        collectionView.register(FoodItemViewCell.self, forCellWithReuseIdentifier: foodItemId)
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

//coredata Operations
extension StatsViewController{
    func getAllItems() {
        do {
            items = try context.fetch(FoodItem.fetchRequest())
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        catch {
            //error
            print(error.localizedDescription)
        }
    }
    
    
    func eventsForDate(date: Date) -> [FoodItem]
    {
        var daysEvents = [FoodItem]()
        for event in items
        {
            if(Calendar.current.isDate(event.date ?? Date(), inSameDayAs:date))
            {
                daysEvents.append(event)
            }
        }
        return daysEvents
    }
}


//collection view controls
extension StatsViewController{
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        //this will invalidate the collection view layout so it knows how to draw itself
            self.collectionViewLayout.invalidateLayout()
    }
    

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if eventsForDate(date: selectedDate).count == 0{
            return 4
        }else{
            return 3+eventsForDate(date: selectedDate).count
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionId, for: indexPath) as! DatePickerViewCell
            cell.dateSelection = self
            
            return cell
        }else if indexPath.item == 1{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: baseId, for: indexPath) as! BaseCell
            cell.numberTextView.text = "Nutrition Budget"
            return cell
        }else if indexPath.item == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: nuttritionId, for: indexPath) as! NutritionViewCell
            let itemContent = indexPath.row-2
            var calories = 0.0
            if eventsForDate(date: selectedDate).count == 0{
                calories = 0.0
            }else{
                calories = eventsForDate(date: selectedDate)[itemContent].calorie
            }
            
            cell.calAmnt.text = String(calories)
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: foodItemId, for: indexPath) as! FoodItemViewCell
            let itemContent = indexPath.row-3
            
            
            if eventsForDate(date: selectedDate).count == 0{
                cell.titleText.text = "No Meals added today"
                cell.subText.text = "Go search and add some items"
                return cell
            }else{
                let datedItem = eventsForDate(date: selectedDate)[itemContent]
                cell.foodItem = datedItem
                return cell
            }
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item == 0{
            return .init(width: view.frame.width - 2 * padding, height: 150)
        }else if indexPath.item == 1{
            return .init(width: view.frame.width - 2 * padding, height: 50)
        }else if indexPath.item == 2{
            return .init(width: view.frame.width - 2 * padding, height: 250)
        }else{
            return .init(width: view.frame.width - 2 * padding, height: 100)
        }
    }
}


class BaseCell: UICollectionViewCell {
    
     var numberTextView: UILabel = {
         var textView = UILabel()
         var attributedText = NSMutableAttributedString(string: "\(1)",attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)])
        textView.attributedText = attributedText
        textView.textColor = .black
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .left
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        addSubview(numberTextView)
        NSLayoutConstraint.activate([
            numberTextView.centerXAnchor.constraint(equalTo: centerXAnchor),
            numberTextView.centerYAnchor.constraint(equalTo: centerYAnchor),
            numberTextView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
        
    }
}
