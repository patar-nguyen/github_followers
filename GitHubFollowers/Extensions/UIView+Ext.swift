//
//  UIView+Ext.swift
//  GitHubFollowers
//
//  Created by Patrick Nguyen on 2022-11-15.
//

import UIKit

extension UIView {
    
    func pinToEdges(of superview: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superview.topAnchor),
            leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            trailingAnchor.constraint(equalTo: superview.trailingAnchor),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor)])
    }
    
    //variatic parameters, allows to add in paramaters and converts to an array and can use array in scope of function
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}
