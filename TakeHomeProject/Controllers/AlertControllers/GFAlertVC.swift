//
//  GFAlertVC.swift
//  TakeHomeProject
//
//  Created by Alexander Ha on 1/26/21.
//

import UIKit

class GFAlertVC: UIViewController {
    
    //MARK: - UIComponents
    
    let containerView = GFAlertContainerView()
    let titleLabel = GFTitleLabel(textAlignment: .center, fontSize: 20)
    let messageLabel = GFBodyLabel(textAlignment: .center)
    let actionButton: GFButton = {
        let button = GFButton(backgroundColor: .systemPink, title: "Ok")
        button.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        return button
    }()
    
    var alertTitle: String?
    var message: String?
    var buttonTitle: String?
    
    //MARK: - Properties
    
    let padding: CGFloat = 20
    
    //MARK: - Lifecycle
    
    init(title: String, message: String, buttonTitle: String) {
        super.init(nibName: nil, bundle: nil)
        self.alertTitle = title
        self.message = message
        self.buttonTitle = buttonTitle
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    //MARK: - Helpers
    
    private func configureUI() {
        view.backgroundColor = UIColor.black.withAlphaComponent(0.75)
        
        configureContainerView()
        configureTitleLabel()
        configureActionButton()
        configureMessageLabel()
    }
    
    
    private func configureContainerView() {
        view.addSubview(containerView)
        containerView.centerInView(view: view)
        containerView.setWidth(width: 280)
        containerView.setHeight(height: 220)
    }
    
    
    private func configureTitleLabel() {
        titleLabel.text = alertTitle ?? "Something went wrong"
        
        containerView.addSubview(titleLabel)
        titleLabel.anchor(top: containerView.topAnchor,
                          leading: containerView.leadingAnchor,
                          trailing: containerView.trailingAnchor,
                          paddingTop: padding,
                          paddingLeading: padding,
                          paddingTrailing: padding,
                          height: 28)
    }
    
    
    private func configureActionButton() {
        actionButton.setTitle(buttonTitle ?? "Ok", for: .normal)
        
        containerView.addSubview(actionButton)
        actionButton.anchor(leading: containerView.leadingAnchor,
                            bottom: containerView.bottomAnchor,
                            trailing: containerView.trailingAnchor,
                            paddingLeading: padding,
                            paddingBottom: padding,
                            paddingTrailing: padding,
                            height: 44)
    }
    
    
    private func configureMessageLabel() {
        messageLabel.text = message ?? "Unable to complete request"
        messageLabel.numberOfLines = 4
        
        containerView.addSubview(messageLabel)
        messageLabel.anchor(top: titleLabel.bottomAnchor,
                            leading: containerView.leadingAnchor,
                            bottom: actionButton.topAnchor,
                            trailing: containerView.trailingAnchor,
                            paddingTop: 8,
                            paddingLeading: padding,
                            paddingTrailing: padding)
    }
    
    //MARK: - Selectors
    
    @objc private func dismissVC() {
        dismiss(animated: true)
    }
    
}
