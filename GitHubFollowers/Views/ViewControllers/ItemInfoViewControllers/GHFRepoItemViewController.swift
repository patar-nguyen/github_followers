//
//  GHFRepoItemViewController.swift
//  GitHubFollowers
//
//  Created by Patrick Nguyen on 2022-11-08.
//

import UIKit

class GHFRepoItemViewController: GHFItemInfoViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .repos, withCount: user.publicRepos)
        itemInfoViewTwo.set(itemInfoType: .gists, withCount: user.publicGists)
        actionButton.set(backgroundColor: .systemPurple, title: "GitHub Profile")
    }
}

