//
//  UserInfoVC.swift
//  TakeHomeProject
//
//  Created by Alexander Ha on 1/27/21.
//

import UIKit

class UserInfoVC: UIViewController {
    
    //MARK: - UIComponents
    
    let headerView = UIView()
    let itemViewOne = UIView()
    let itemViewTwo = UIView()
    
    //MARK: - Properties
    
    var username: String!
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        getUserInfo()
    }
    
    //MARK: - Helpers
    
    fileprivate func getUserInfo() {
        NetworkManager.shared.getUserInfo(for: username) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let user):
                DispatchQueue.main.async {
                    self.add(childVC: GFUserHeaderVC(user: user), to: self.headerView)
                }
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "Ok")
            }
        }
    }
    
    func add(childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
    
    
    private func configureUI() {
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
        view.backgroundColor = .systemBackground
        
        let padding: CGFloat = 20
        let itemHeight: CGFloat = 140
        
        view.addSubview(headerView)
        headerView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                          leading: view.leadingAnchor,
                          trailing: view.trailingAnchor,
                          height: 180)
        
        view.addSubview(itemViewOne)
        itemViewOne.backgroundColor = .systemPink
        itemViewOne.anchor(top: headerView.bottomAnchor,
                           leading: view.leadingAnchor,
                           trailing: view.trailingAnchor,
                           paddingTop: padding,
                           paddingLeading: padding,
                           paddingTrailing: padding,
                           height: itemHeight)
        
        view.addSubview(itemViewTwo)
        itemViewTwo.backgroundColor = .systemBlue
        itemViewTwo.anchor(top: itemViewOne.bottomAnchor,
                           leading: view.leadingAnchor,
                           trailing: view.trailingAnchor,
                           paddingTop: padding,
                           paddingLeading: padding,
                           paddingTrailing: padding,
                           height: itemHeight)
    }
    
    //MARK: - Selectors
    
    @objc private func dismissVC() {
        dismiss(animated: true)
    }
    
}
