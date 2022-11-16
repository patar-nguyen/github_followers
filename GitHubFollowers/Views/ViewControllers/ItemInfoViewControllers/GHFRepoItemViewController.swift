//
//  GHFRepoItemViewController.swift
//  GitHubFollowers
//
//  Created by Patrick Nguyen on 2022-11-08.
//

import UIKit

protocol GHFRepoItemViewControllerDelegate: class {
    func didTapGitHubProfile(for user: User)
}

class GHFRepoItemViewController: GHFItemInfoViewController {
    
    weak var delegate: GHFRepoItemViewControllerDelegate!
    
    init(user: User, delegate: GHFRepoItemViewControllerDelegate) {
        super.init(user: user)
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .repos, withCount: user.publicRepos)
        itemInfoViewTwo.set(itemInfoType: .gists, withCount: user.publicGists)
        actionButton.set(backgroundColor: .systemPurple, title: "GitHub Profile")
    }
    
    override func actionButtonTapped() {
        delegate.didTapGitHubProfile(for: user)
    }
}

