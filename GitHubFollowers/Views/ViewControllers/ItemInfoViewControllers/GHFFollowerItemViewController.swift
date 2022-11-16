//
//  GHFFollowerItemViewController.swift
//  GitHubFollowers
//
//  Created by Patrick Nguyen on 2022-11-09.
//

import UIKit

protocol GHFFollowerViewControllerDelegate: AnyObject {
    func didTapGetFollowers(for user: User)
}

class GHFFollowerItemViewController: GHFItemInfoViewController {
    
    weak var delegate: GHFFollowerViewControllerDelegate!
    
    init(user: User, delegate: GHFFollowerViewControllerDelegate) {
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
        itemInfoViewOne.set(itemInfoType: .followers, withCount: user.followers)
        itemInfoViewTwo.set(itemInfoType: .following, withCount: user.following)
        actionButton.set(color: .systemGreen, title: "Get Followers", systemImageName: "person.3")
    }
    
    override func actionButtonTapped() {
        delegate.didTapGetFollowers(for: user)
    }
}
