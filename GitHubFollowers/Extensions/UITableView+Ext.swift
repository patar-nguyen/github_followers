//
//  UITableView+Ext.swift
//  GitHubFollowers
//
//  Created by Patrick Nguyen on 2022-11-16.
//

import UIKit

extension UITableView {
    
    //not used in this project but can be used to reload table views
    func reloadDataOnMainThread() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
    
    func removeExcessCells() {
        tableFooterView = UIView(frame: .zero)
    }
}
