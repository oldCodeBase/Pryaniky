//
//  CustomCell.swift
//  Pryaniky
//
//  Created by Ibragim Akaev on 08/06/2021.
//

import UIKit
import Kingfisher

final class CustomCell: UITableViewCell {
    
    static let reuseID      = "CustomCell"
    let descriptionLabel    = BodyLabel(textAlignment: .left, textColor: .systemOrange)
    let segmentedControl    = UISegmentedControl()
    let pictureImageView    = UIImageView()
    let stackView           = UIStackView()
    
    var rowType: RowTypeProtocol? {
        didSet {
            guard let rowType         = rowType else { return }
            descriptionLabel.isHidden = !rowType.containsText
            pictureImageView.isHidden = !rowType.containsImage
            segmentedControl.isHidden = !rowType.containsSegmentedControl
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        descriptionLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        
        [descriptionLabel, segmentedControl, pictureImageView].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setupLayout() {
        contentView.isUserInteractionEnabled = false
        
        NSLayoutConstraint.activate([
            descriptionLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            descriptionLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            pictureImageView.heightAnchor.constraint(equalToConstant: 58),
            pictureImageView.widthAnchor.constraint(equalToConstant: 58),
            pictureImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            pictureImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
            segmentedControl.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            segmentedControl.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
    
    func set(with viewModel: DataResponse) {
        descriptionLabel.text = viewModel.data.text
        
        if let segments = viewModel.data.variants {
            for (index, segment) in segments.enumerated() {
                segmentedControl.insertSegment(withTitle: segment.text, at: index, animated: false)
            }
        }
        
        if let selectedSegment = viewModel.data.selectedId {
            segmentedControl.selectedSegmentIndex = selectedSegment - 1
        }
        
        if let urlString = viewModel.data.url {
            pictureImageView.kf.setImage(with: URL(string: urlString))
        }
    }
}

