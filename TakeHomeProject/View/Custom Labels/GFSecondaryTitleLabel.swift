//
//  GFSecondaryTitleLabel.swift
//  TakeHomeProject
//
//  Created by Alexander Ha on 1/27/21.
//

import UIKit

class GFSecondaryTitleLabel: UILabel {

    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
   convenience init(fontSize: CGFloat) {
        self.init(frame: .zero)
        font = UIFont.systemFont(ofSize: fontSize, weight: .medium)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    private func configureUI() {
        textColor = .secondaryLabel
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.90
        lineBreakMode = .byTruncatingTail
    }

}
