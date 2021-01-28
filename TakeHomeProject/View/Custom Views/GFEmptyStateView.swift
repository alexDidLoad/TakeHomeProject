//
//  GFEmptyStateView.swift
//  TakeHomeProject
//
//  Created by Alexander Ha on 1/27/21.
//

import UIKit

class GFEmptyStateView: UIView {
    
    //MARK: - UIComponents
    
    let messageLabel = GFTitleLabel(textAlignment: .center, fontSize: 28)
    let logoImageView = UIImageView()
    
    //MARK: - Properties
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    
    init(message: String) {
        super.init(frame: .zero)
        messageLabel.text = message
        configureUI()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    private func configureUI() {
        addSubview(messageLabel)
        messageLabel.numberOfLines = 3
        messageLabel.textColor = .secondaryLabel
        messageLabel.centerY(inView: self, constant: -150)
        messageLabel.anchor(leading: self.leadingAnchor,
                            trailing: self.trailingAnchor,
                            paddingLeading: 40,
                            paddingTrailing: 40,
                            height: 200)
        
        addSubview(logoImageView)
        logoImageView.image = UIImage(named: "empty-state-logo")
        logoImageView.anchor(bottom: self.bottomAnchor,
                             trailing: self.trailingAnchor,
                             paddingBottom: -40,
                             paddingTrailing: -170)
        NSLayoutConstraint.activate([
            logoImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
            logoImageView.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3)
        ])
        
    }
    
}
