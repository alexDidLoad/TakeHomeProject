//
//  GFItemInfoView.swift
//  TakeHomeProject
//
//  Created by Alexander Ha on 1/28/21.
//

import UIKit


enum ItemInfoType {
    case repos, gists, followers, following
}


class GFItemInfoView: UIView {
    
    //MARK: - UIComponents
    
    let symbolImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.tintColor = .label
        return iv
    }()
    let titleLabel = GFTitleLabel(textAlignment: .left, fontSize: 14)
    let countLabel = GFTitleLabel(textAlignment: .center, fontSize: 14)
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helper
    
    func set(itemInfoType: ItemInfoType, withCount count: Int) {
        switch itemInfoType {
        case .repos:
            symbolImageView.image = SFSymbols.repos
            titleLabel.text = "Public Repos"
        case .gists:
            symbolImageView.image = SFSymbols.gists
            titleLabel.text = "Public Gists"
        case .followers:
            symbolImageView.image = SFSymbols.followers
            titleLabel.text = "Followers"
        case .following:
            symbolImageView.image = SFSymbols.following
            titleLabel.text = "Following"
        }
        countLabel.text = String(count)
    }
    
    private func configureUI() {
        addSubview(symbolImageView)
        symbolImageView.anchor(top: topAnchor,
                               leading: leadingAnchor,
                               height: 20,
                               width: 20)
        addSubview(titleLabel)
        titleLabel.centerY(inView: symbolImageView)
        titleLabel.anchor(leading: symbolImageView.trailingAnchor,
                          trailing: trailingAnchor,
                          paddingLeading: 8,
                          height: 18)
        addSubview(countLabel)
        countLabel.anchor(top: symbolImageView.bottomAnchor,
                          leading: leadingAnchor,
                          trailing: trailingAnchor,
                          paddingTop: 4,
                          height: 18)
    }
    
}
