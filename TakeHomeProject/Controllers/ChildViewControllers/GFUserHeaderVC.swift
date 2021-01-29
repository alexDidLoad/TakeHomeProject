//
//  GFUserHeaderVC.swift
//  TakeHomeProject
//
//  Created by Alexander Ha on 1/27/21.
//

import UIKit

class GFUserHeaderVC: UIViewController {
    
    //MARK: - UIComponents
    
    let avatarImageView = GFAvatarImageView(frame: .zero)
    let usernameLabel = GFTitleLabel(textAlignment: .left, fontSize: 34)
    let nameLabel = GFSecondaryTitleLabel(fontSize: 18)
    let locationImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(systemName: SFSymbols.location))
        iv.tintColor = .secondaryLabel
        return iv
    }()
    let locationLabel = GFSecondaryTitleLabel(fontSize: 18)
    let bioLabel = GFBodyLabel(textAlignment: .left)
    
    //MARK: - Properties
    
    var user: User!
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureUIElements()
    }
    
    
    init(user: User) {
        super.init(nibName: nil, bundle: nil)
        self.user = user
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Helpers
    
    func configureUIElements() {
        avatarImageView.downloadImage(from: user.avatarUrl)
        usernameLabel.text = user.login
        nameLabel.text = user.name ?? ""
        locationLabel.text = user.location ?? "N/A"
        bioLabel.text = user.bio ?? "No bio available"
    }
    
    
    private func configureUI() {
        let padding: CGFloat = 20
        let textImagePadding: CGFloat = 12
        
        view.addSubview(avatarImageView)
        avatarImageView.anchor(top: view.topAnchor,
                               leading: view.leadingAnchor,
                               paddingTop: padding,
                               paddingLeading: padding,
                               height: 90,
                               width: 90)
        
        view.addSubview(usernameLabel)
        usernameLabel.anchor(top: avatarImageView.topAnchor,
                             leading: avatarImageView.trailingAnchor,
                             trailing: view.trailingAnchor,
                             paddingLeading: textImagePadding,
                             paddingTrailing: textImagePadding,
                             height: 38)
        
        view.addSubview(nameLabel)
        nameLabel.anchor(top: usernameLabel.bottomAnchor,
                         leading: usernameLabel.leadingAnchor,
                         trailing: usernameLabel.trailingAnchor,
                         paddingTop: 6)
        
        view.addSubview(locationImageView)
        locationImageView.anchor(leading: avatarImageView.trailingAnchor,
                                 bottom: avatarImageView.bottomAnchor,
                                 paddingLeading: 8,
                                 height: 20,
                                 width: 20)
        
        view.addSubview(locationLabel)
        locationLabel.centerY(inView: locationImageView, constant: 2)
        locationLabel.anchor(leading: locationImageView.trailingAnchor,
                             trailing: view.trailingAnchor,
                             paddingLeading: 5,
                             height: 20)
        
        view.addSubview(bioLabel)
        bioLabel.numberOfLines = 3
        bioLabel.anchor(top: avatarImageView.bottomAnchor,
                        leading: avatarImageView.leadingAnchor,
                        trailing: view.trailingAnchor,
                        paddingTop: textImagePadding,
                        paddingTrailing: padding,
                        height: 60)
    }
    
}
