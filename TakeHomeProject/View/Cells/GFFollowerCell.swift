//
//  GFFollowerCell.swift
//  TakeHomeProject
//
//  Created by Alexander Ha on 1/27/21.
//

import UIKit

class GFFollowerCell: UICollectionViewCell {
    
    //MARK: - UIComponents
    
    let avatarImageView = GFAvatarImageView(frame: .zero)
    let usernameLabel = GFTitleLabel(textAlignment: .center, fontSize: 16)
    
    //MARK: - Properties
    
    static let reuseID = "GFFollowerCell"
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    func set(follower: Follower) {
        usernameLabel.text = follower.login
        avatarImageView.downloadImage(fromURL: follower.avatarUrl)
    }
    
    
    private func configureUI() {
        let padding: CGFloat = 8
        
        addSubview(avatarImageView)
        avatarImageView.anchor(top: contentView.topAnchor,
                               leading: contentView.leadingAnchor,
                               trailing: contentView.trailingAnchor,
                               paddingTop: padding,
                               paddingLeading: padding,
                               paddingTrailing: padding)
        avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor).isActive = true
        
        addSubview(usernameLabel)
        usernameLabel.anchor(top: avatarImageView.bottomAnchor,
                             leading: contentView.leadingAnchor,
                             trailing: contentView.trailingAnchor,
                             paddingTop: 12,
                             paddingLeading: padding,
                             paddingTrailing: padding,
                             height: 20)
    }
    
}
