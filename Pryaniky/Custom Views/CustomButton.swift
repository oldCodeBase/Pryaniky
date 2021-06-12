//
//  CustomButton.swift
//  Pryaniky
//
//  Created by Ibragim Akaev on 09/06/2021.
//

import UIKit

final class CustomButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(backgroundColor: UIColor, title: String) {
        self.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
    }
    
    private func configure() {
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = 10
        titleLabel?.font   = UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
