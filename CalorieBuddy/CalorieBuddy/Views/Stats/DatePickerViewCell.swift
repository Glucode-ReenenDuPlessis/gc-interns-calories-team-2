//
//  DatePickerViewCell.swift
//  CalorieBuddy
//
//  Created by Pat on 2022/09/28.
//

import UIKit

class DatePickerViewCell:  UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    let cellID = "cell"
    var totalSquares = [Date]()
    var selectedDate = Date()
        
    var appsCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setWeekView()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        let flowLayout = appsCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.scrollDirection = .horizontal
        appsCollectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height), collectionViewLayout: flowLayout)
        appsCollectionView.delegate = self
        appsCollectionView.dataSource = self
        appsCollectionView.isPagingEnabled = true
        appsCollectionView.backgroundColor = UIColor.clear.withAlphaComponent(0)
        appsCollectionView.register(AppCell.self, forCellWithReuseIdentifier: "cell")
        addSubview(appsCollectionView)
        

    }
    
    func setWeekView()
    {
        totalSquares.removeAll()
        
        var current = CalendarHelper().sundayForDate(date: selectedDate)
        let nextSunday = CalendarHelper().addDays(date: current, days: 7)
        
        while (current < nextSunday)
        {
            totalSquares.append(current)
            current = CalendarHelper().addDays(date: current, days: 1)
        }
        
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        totalSquares.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! AppCell
        let date = totalSquares[indexPath.item]
        cell.numberTextView.text = String(CalendarHelper().dayOfMonth(date: date))
        cell.layer.cornerRadius = 20
        cell.backgroundColor = .systemGray
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (appsCollectionView.frame.size.width - 2) / 8.45
        let height = (appsCollectionView.frame.size.height - 2) / 2
        return CGSize(width: width, height: height)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        selectedDate = totalSquares[indexPath.item]
        print("\(selectedDate)")
        
    }
    
}

class AppCell: UICollectionViewCell {
    
     let numberTextView: UILabel = {
        let textView = UILabel()
        let attributedText = NSMutableAttributedString(string: "\(1)",attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 15)])
        textView.attributedText = attributedText
        textView.textColor = .white
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
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
            numberTextView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
    }
}