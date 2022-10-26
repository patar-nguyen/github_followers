//
//  UIViewController+Ext.swift
//  GitHubFollowers
//
//  Created by Patrick Nguyen on 2022-10-26.
//

import UIKit

extension UIViewController {
    
    func presentGHFAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertViewController = GHFAlertViewController(title: title, message: message, buttonTitle: buttonTitle)
            alertViewController.modalPresentationStyle = .overFullScreen
            alertViewController.modalTransitionStyle = .crossDissolve
            self.present(alertViewController, animated: true)
        }
    }
}
