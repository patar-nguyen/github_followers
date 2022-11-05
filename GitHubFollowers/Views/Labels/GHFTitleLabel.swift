//
//  GHFTitleLabel.swift
//  GitHubFollowers
//
//  Created by Patrick Nguyen on 2022-10-26.
//

import UIKit

class GHFTitleLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(textAlighment: NSTextAlignment, fontSize: CGFloat) {
        super.init(frame: .zero)
        self.textAlignment = textAlighment
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
        configure()
    }
    
    private func configure() {
        textColor = .label
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.90
        lineBreakMode = .byTruncatingTail //if too long the name will become ... at the end eg patr...
        translatesAutoresizingMaskIntoConstraints = false
    }
}
