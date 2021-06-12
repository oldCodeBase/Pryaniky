//
//  AlertViewController.swift
//  Pryaniky
//
//  Created by Ibragim Akaev on 09/06/2021.
//

import UIKit

final class AlertViewController: UIViewController {
    
    private let containerView = AlertContainerView()
    private let titleLabel    = TitleLabel(textAlignment: .center, fontSize: 20)
    private let messageLabel  = BodyLabel(textAlignment: .center, textColor: .secondaryLabel)
    private let actionButton  = CustomButton(backgroundColor: .systemPink, title: "Ok")
    
    var viewModel: AlertViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupLayout()
    }
    
    private func setupViews() {
        view.backgroundColor = UIColor.black.withAlphaComponent(0.75)
        
        [containerView, titleLabel, actionButton, messageLabel].forEach { view.addSubview($0) }
        
        if viewModel.selectedSegment != nil {
            titleLabel.text = viewModel.segmentDescribeText + "\(viewModel.selectedSegment! + 1)"
        } else { titleLabel.text = viewModel.title }
        
        messageLabel.text = viewModel.message
        actionButton.addTarget(self, action: #selector(OkTapped), for: .touchUpInside)
    }
    
    private func setupLayout() {
        let padding: CGFloat = 20
        
        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 280),
            containerView.heightAnchor.constraint(equalToConstant: 160),
            
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 28),
            
            actionButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -padding),
            actionButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            actionButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            actionButton.heightAnchor.constraint(equalToConstant: 44),
            
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            messageLabel.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -12)
        ])
    }
    
    @objc private func OkTapped() {
        viewModel.viewDidFinish()
    }
}
