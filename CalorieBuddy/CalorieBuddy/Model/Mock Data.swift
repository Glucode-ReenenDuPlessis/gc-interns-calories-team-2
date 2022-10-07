//
//  Mock Data.swift
//  CalorieBuddy
//
//  Created by Sibusiso Mbonani on 2022/10/06.
//

import Foundation

let categories = ["Asian", "Traditional Tai", "Japanese", "Korean", "Indian", "African"]
let subTitle = ["12 Receps", "32 Receps", "78 Receps", "13 Receps", "45 Receps", "54 Receps"]

struct MockData {
    static let shared = MockData()
    
    private let header: ListSection = {
        .header([.init(title: "Asian", subTitle: ""),
                 .init(title: "Traditional Tai", subTitle: ""),
                 .init(title: "Japanese", subTitle: ""),
                 .init(title: "Korean", subTitle: ""),
                 .init(title: "Indian", subTitle: ""),
                 .init(title: "African", subTitle: "")])
    }()
    
    private let body: ListSection = {
        .header([.init(title: "Asian", subTitle: "12 Receps"),
                 .init(title: "Traditional Tai", subTitle: "32 Receps"),
                 .init(title: "Japanese", subTitle: "78 Receps"),
                 .init(title: "Korean", subTitle: "13 Receps"),
                 .init(title: "Indian", subTitle: "45 Receps"),
                 .init(title: "African", subTitle: "54 Receps")])
    }()
    
    var pageData: [ListSection] {
        [body, header]
    }
}
