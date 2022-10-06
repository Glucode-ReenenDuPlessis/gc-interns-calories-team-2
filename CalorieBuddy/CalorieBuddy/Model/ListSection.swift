//
//  ListSection.swift
//  CalorieBuddy
//
//  Created by Sibusiso Mbonani on 2022/10/06.
//

import Foundation

enum ListSection {
    case header([ListItem])
    case body([ListItem])
    
    var items: [ListItem] {
        switch self {
        case .header(let items),
                .body(let items):
            return items
        }
    }

    var count: Int {
        return items.count
    }
}


