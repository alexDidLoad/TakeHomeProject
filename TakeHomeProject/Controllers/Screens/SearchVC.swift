//
//  SearchVC.swift
//  TakeHomeProject
//
//  Created by Alexander Ha on 1/21/21.
//

import UIKit

class SearchVC: UIViewController {
    
    //MARK: - UIComponents
    
    let logoImageView = UIImageView()
    let userNameTextField = GFTextField()
    let callToActionButton: GFButton = {
        let button = GFButton(backgroundColor: .systemGreen, title: "Get Followers")
        button.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside)
        return button
    }()
    
    var isUsernameEntered: Bool { return !userNameTextField.text!.isEmpty }
    
    
    //MARK: - Properties
    
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        createDismissKeyboardTapGesture()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    //MARK: - Helpers
    
    private func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    
    private func configureUI() {
        view.backgroundColor = .systemBackground
        configureLogo()
        configureTextField()
        configureCallToActionButton()
    }
    
    
    private func configureLogo() {
        view.addSubview(logoImageView)
        logoImageView.image = UIImage(named: "gh-logo")
        logoImageView.centerX(inView: view)
        logoImageView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                             paddingTop: 80,
                             height: 200,
                             width: 200)
    }
    
    
    private func configureTextField() {
        view.addSubview(userNameTextField)
        userNameTextField.delegate = self
        
        userNameTextField.anchor(top: logoImageView.bottomAnchor,
                                 leading: view.leadingAnchor,
                                 trailing: view.trailingAnchor,
                                 paddingTop: 48,
                                 paddingLeading: 50,
                                 paddingTrailing: 50,
                                 height: 50)
    }
    
    
    private func configureCallToActionButton() {
        view.addSubview(callToActionButton)
        
        callToActionButton.anchor(leading: view.leadingAnchor,
                                  bottom: view.safeAreaLayoutGuide.bottomAnchor,
                                  trailing: view.trailingAnchor,
                                  paddingLeading: 50,
                                  paddingBottom: 50,
                                  paddingTrailing: 50,
                                  height: 50)
    }
    
    //MARK: - Selectors
        
    @objc private func pushFollowerListVC() {
        guard isUsernameEntered else {
            presentGFAlertOnMainThread(title: "Empty Username", message: "Please enter a username 🙂", buttonTitle: "Ok")
            return
        }
        
        let followerListVC = FollowerListVC()
        followerListVC.username = userNameTextField.text
        followerListVC.title = userNameTextField.text
        navigationController?.pushViewController(followerListVC, animated: true)
    }
    
}

//MARK: - UITextFieldDelegate

extension SearchVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowerListVC()
        return true
    }
    
}
