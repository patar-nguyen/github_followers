//
//  GHFTextField.swift
//  GitHubFollowers
//
//  Created by Patrick Nguyen on 2022-10-24.
//

import UIKit

class GHFTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false

        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGray4.cgColor
        
        //.label is black on light mode and white in dark mode
        textColor = .label
        //tintColor is the blinking cursor
        tintColor = .label
        textAlignment = .center
        font = UIFont.preferredFont(forTextStyle: .title2)
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 12
        
        backgroundColor = .tertiarySystemBackground
        autocorrectionType = .no
        //keyboardType = .default
        returnKeyType = .go
        clearButtonMode = .whileEditing
        placeholder = "Enter a username"
        
    }
}

