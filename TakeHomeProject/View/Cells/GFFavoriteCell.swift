//
//  GFFavoriteCell.swift
//  TakeHomeProject
//
//  Created by Alexander Ha on 1/28/21.
//

import UIKit

class GFFavoriteCell: UITableViewCell {
    
    //MARK: - UIComponent
    
    let avatarImageView = GFAvatarImageView(frame: .zero)
    let usernameLabel = GFTitleLabel(textAlignment: .left, fontSize: 26)
    
    //MARK: - Properties
    
    static let reuseID = "FavoriteCell"
   
    //MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    func set(favorite: Follower) {
        usernameLabel.text = favorite.login
        avatarImageView.downloadImage(from: favorite.avatarUrl)
    }
    
    
    private func configureUI() {
        let padding: CGFloat = 12
        accessoryType = .disclosureIndicator
        
        addSubview(avatarImageView)
        avatarImageView.centerY(inView: self)
        avatarImageView.anchor(leading: leadingAnchor,
                               paddingLeading: padding,
                               height: 60,
                               width: 60)
        
        addSubview(usernameLabel)
        usernameLabel.centerY(inView: self)
        usernameLabel.anchor(leading: avatarImageView.trailingAnchor,
                             trailing: trailingAnchor,
                             paddingLeading: padding * 2,
                             paddingTrailing: padding,
                             height: 40)
    }
    
}
