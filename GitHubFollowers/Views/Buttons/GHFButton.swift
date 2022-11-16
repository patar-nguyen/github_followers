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
    
    convenience init(color: UIColor, title: String, systemImageName: String) {
        //super.init(frame: .zero)
        self.init(frame: .zero)
        set(color: color, title: title, systemImageName: systemImageName)
//        self.backgroundColor = backgroundColor
//        self.setTitle(title, for: .normal)
        //configure()
    }
    
    //private can only be called inside GHFButton class
    private func configure() {
        configuration = .filled()
        configuration?.cornerStyle = .medium
        
        //layer.cornerRadius = 10
        //titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        //setTitleColor(.white, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    final func set(color: UIColor, title: String, systemImageName: String) {
        
        configuration?.baseBackgroundColor = color
        configuration?.baseForegroundColor = .white
        configuration?.title = title
        
        configuration?.image = UIImage(systemName: systemImageName)
        configuration?.imagePadding = 6
        configuration?.imagePlacement = .leading
        
        //self.backgroundColor = backgroundColor
        //setTitle(title, for: .normal)
    }
}
