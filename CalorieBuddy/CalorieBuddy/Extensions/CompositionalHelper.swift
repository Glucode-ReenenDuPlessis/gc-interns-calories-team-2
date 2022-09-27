//
//  CompositionalHelper.swift
//  SampleAPICall
//
//  Created by Pat on 2022/09/21.
//


import UIKit

enum CompositionalGroupAlignment{
     case vertical
    case hortizontal
}

struct CompositionalLayout{
    static func createItem(w width:NSCollectionLayoutDimension,
                           h height:NSCollectionLayoutDimension,
                           spacing:CGFloat) -> NSCollectionLayoutItem{
        let item  = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: width, heightDimension: height ))
        item.contentInsets = NSDirectionalEdgeInsets(top: spacing, leading: spacing, bottom: spacing, trailing: spacing)
        return item
    }
    
    
    static func createGroup(alignment: CompositionalGroupAlignment,
                            w width:NSCollectionLayoutDimension,
                            h height:NSCollectionLayoutDimension,
                            item: NSCollectionLayoutItem,
                            count: Int) -> NSCollectionLayoutGroup{
        switch alignment {
        case .vertical:
            return NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: width, heightDimension: height), subitem: item, count: count)
        case .hortizontal:
            return NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: width, heightDimension: height), subitem: item,count: count)
        }
    }
    
    static func createGroup(alignment: CompositionalGroupAlignment,
                            w width:NSCollectionLayoutDimension,
                            h height:NSCollectionLayoutDimension,
                            items: [NSCollectionLayoutItem]) -> NSCollectionLayoutGroup{
        switch alignment {
        case .vertical:
            return NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: width, heightDimension: height), subitems: items)
        case .hortizontal:
            return NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: width, heightDimension: height), subitems: items)
        }
    }
    
}
