//
//  UIViewController+Ext.swift
//  GitHubFollowers
//
//  Created by Patrick Nguyen on 2022-10-26.
//

import UIKit
import SafariServices

extension UIViewController {
    //old way when using network call
//    func presentGHFAlertOnMainThread(title: String, message: String, buttonTitle: String) {
//        DispatchQueue.main.async {
//            let alertViewController = GHFAlertViewController(title: title, message: message, buttonTitle: buttonTitle)
//            alertViewController.modalPresentationStyle = .overFullScreen
//            alertViewController.modalTransitionStyle = .crossDissolve
//            self.present(alertViewController, animated: true)
//        }
//    }
    
    func presentGHFAlert(title: String, message: String, buttonTitle: String) {
            let alertViewController = GHFAlertViewController(title: title, message: message, buttonTitle: buttonTitle)
            alertViewController.modalPresentationStyle = .overFullScreen
            alertViewController.modalTransitionStyle = .crossDissolve
            present(alertViewController, animated: true)
    }
    
    func presentDefaultError() {
            let alertViewController = GHFAlertViewController(title: "Something went wrong.", message: "Unable to complete task. Please try again.", buttonTitle: "Ok")
            alertViewController.modalPresentationStyle = .overFullScreen
            alertViewController.modalTransitionStyle = .crossDissolve
            present(alertViewController, animated: true)
    }
    
    func presentSafariViewController(with url: URL) {
        let safariViewController = SFSafariViewController(url: url)
        safariViewController.preferredControlTintColor = .systemGreen
        present(safariViewController, animated: true)
    }
    //moved to GHFDataLoadingViewController
//    func showLoadingView() {
//        containerView = UIView(frame: view.bounds)
//        view.addSubview(containerView)
//
//        containerView.backgroundColor = .systemBackground
//        containerView.alpha = 0
//
//        UIView.animate(withDuration: 0.25) { containerView.alpha = 0.8 }
//
//        let activityIndicator = UIActivityIndicatorView(style: .large)
//        containerView.addSubview(activityIndicator)
//        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor)
//        ])
//
//        activityIndicator.startAnimating()
//    }
//
//    func dismissLoadingView() {
//        DispatchQueue.main.async {
//            containerView.removeFromSuperview()
//            containerView = nil
//        }
//    }
//
//    func showEmptyStateView(with message: String, in view: UIView) {
//        let emptyStateView = GHFEmptyStateView(message: message)
//        emptyStateView.frame = view.bounds
//        view.addSubview(emptyStateView)
//    }
}
