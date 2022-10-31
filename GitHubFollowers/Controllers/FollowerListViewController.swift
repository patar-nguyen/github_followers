//
//  FollowerListViewController.swift
//  GitHubFollowers
//
//  Created by Patrick Nguyen on 2022-10-26.
//

import UIKit

class FollowerListViewController: UIViewController {

    var username: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        NetworkManager.shared.getFollowers(for: username, page: 1) { /*(followers, errorMessage)*/ result in
            switch result {
            case.success(let followers):
                print(followers)
            case.failure(let error):
                self.presentGHFAlertOnMainThread(title: "Bad Stuff Happened", message: error.rawValue, buttonTitle: "ok")

            }
            
//            guard let followers = followers else {
//                self.presentGHFAlertOnMainThread(title: "Bad Stuff Happened", message: errorMessage!.rawValue, buttonTitle: "ok")
//                return
//            }
//            print("followers.count = \(followers.count)")
//            print(followers)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //navigationController?.isNavigationBarHidden = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
