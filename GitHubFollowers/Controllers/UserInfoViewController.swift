//
//  UserInfoViewController.swift
//  GitHubFollowers
//
//  Created by Patrick Nguyen on 2022-11-06.
//

import UIKit

class UserInfoViewController: UIViewController {

    var username: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissViewController))
        navigationItem.rightBarButtonItem = doneButton
        
        NetworkManager.shared.getUserInfo(for: username) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let user):
                print (user)
                
            case .failure(let error):
                self.presentGHFAlertOnMainThread(title: "Error", message: error.rawValue, buttonTitle: "Ok")
            }
        }
    }
    
    @objc func dismissViewController() {
        dismiss(animated: true)
    }
}
