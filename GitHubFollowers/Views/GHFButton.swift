//
//  GHFButton.swift
//  GitHubFollowers
//
//  Created by Patrick Nguyen on 2022-10-24.
//

import UIKit

class GHFButton: UIButton {
    //allows us to make a
    override init(frame: CGRect) {
        //calling the UIButton
        super.init(frame: frame)
        //custom code - building GHFButton on top of UIButton (GHFButton is like child class of UIButton)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(backgroundColor: UIColor, title: String) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        configure()
    }
    
    //private can only be called inside GHFButton class
    private func configure() {
        layer.cornerRadius = 10
        titleLabel?.textColor = .white
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
