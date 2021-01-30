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
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    
    convenience init(message: String) {
        self.init(frame: .zero)
        messageLabel.text = message
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers

    
    private func configureUI() {
        configureMessageLabel()
        configureLogoImage()
    }
    
    private func configureMessageLabel() {
        addSubview(messageLabel)
        messageLabel.numberOfLines = 3
        messageLabel.textColor = .secondaryLabel
        
        let messageLabelCenterYConstant: CGFloat = DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8Zoomed ? -120 : -150
        messageLabel.centerY(inView: self, constant: messageLabelCenterYConstant)
        messageLabel.anchor(leading: self.leadingAnchor,
                            trailing: self.trailingAnchor,
                            paddingLeading: 40,
                            paddingTrailing: 40,
                            height: 200)
    }
    
    private func configureLogoImage() {
        addSubview(logoImageView)
        logoImageView.image = Images.emptyStateLogo
        
        let logoImageViewBottomConstant: CGFloat = DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8Zoomed ? 80 : 40
        logoImageView.anchor(bottom: self.bottomAnchor,
                             trailing: self.trailingAnchor,
                             paddingBottom: -logoImageViewBottomConstant,
                             paddingTrailing: -170)
        NSLayoutConstraint.activate([
            logoImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
            logoImageView.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3)
        ])
    }
    
}
