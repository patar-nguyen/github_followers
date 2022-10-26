//
//  GHFBodyLabel.swift
//  GitHubFollowers
//
//  Created by Patrick Nguyen on 2022-10-26.
//

import UIKit

class GHFBodyLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(textAlighment: NSTextAlignment) {
        super.init(frame: .zero)
        self.textAlignment = textAlighment
        configure()
    }
    
    private func configure() {
        textColor = .secondaryLabel
        font = UIFont.preferredFont(forTextStyle: .body)
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.75
        lineBreakMode = .byWordWrapping
        translatesAutoresizingMaskIntoConstraints = false
    }
}
