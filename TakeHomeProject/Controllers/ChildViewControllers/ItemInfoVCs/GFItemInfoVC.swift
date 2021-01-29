//
//  GFItemInfoVC.swift
//  TakeHomeProject
//
//  Created by Alexander Ha on 1/28/21.
//

import UIKit


class GFItemInfoVC: UIViewController {
    
    //MARK: - UIComponents
    
    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        return stack
    }()
    let itemInfoViewOne = GFItemInfoView()
    let itemInfoViewTwo = GFItemInfoView()
    let actionButton: GFButton = {
        let button = GFButton()
        button.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Properties
    
    var user: User!
    weak var delegate: UserInfoVCDelegate!
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    
    init(user: User) {
        super.init(nibName: nil, bundle: nil)
        self.user = user
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Helper
    
    private func configureUI() {
        view.layer.cornerRadius = 18
        view.backgroundColor = .secondarySystemBackground
        
        let padding: CGFloat = 20
        
        view.addSubview(stackView)
        stackView.addArrangedSubview(itemInfoViewOne)
        stackView.addArrangedSubview(itemInfoViewTwo)
        stackView.anchor(top: view.topAnchor,
                         leading: view.leadingAnchor,
                         trailing: view.trailingAnchor,
                         paddingTop: padding,
                         paddingLeading: padding,
                         paddingTrailing: padding,
                         height: 50)
        
        view.addSubview(actionButton)
        actionButton.anchor(leading: view.leadingAnchor,
                            bottom: view.bottomAnchor,
                            trailing: view.trailingAnchor,
                            paddingLeading: padding,
                            paddingBottom: padding,
                            paddingTrailing: padding,
                            height: 44)
    }
    
    //MARK: - Selector
    
    @objc func actionButtonTapped() {}
    
}
