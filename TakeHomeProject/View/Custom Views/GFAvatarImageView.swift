//
//  GFImageView.swift
//  TakeHomeProject
//
//  Created by Alexander Ha on 1/27/21.
//

import UIKit

class GFAvatarImageView: UIImageView {
    
    //MARK: - Properties
    
    let cache = NetworkManager.shared.cache
    let placeholderImage = Images.placeholder
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    private func configureUI() {
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeholderImage
    }
    
}
