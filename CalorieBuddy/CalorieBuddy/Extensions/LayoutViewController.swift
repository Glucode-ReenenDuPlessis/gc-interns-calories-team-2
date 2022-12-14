//
//  LayoutViewController.swift
//  CalorieBuddy
//
//  Created by Sibusiso Mbonani on 2022/10/03.
//

import Foundation
import UIKit

public extension UIView {
    func pinEdges(to view: UIView) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: view.leadingAnchor),
            trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topAnchor.constraint(equalTo: view.topAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

