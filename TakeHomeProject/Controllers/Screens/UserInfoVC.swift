//
//  UserInfoVC.swift
//  TakeHomeProject
//
//  Created by Alexander Ha on 1/27/21.
//

import UIKit

protocol UserInfoVCDelegate: AnyObject {
    func didRequestFollowers(for username: String)
}

class UserInfoVC: GFDataLoadingVC {
    
    //MARK: - UIComponents
    
    let headerView = UIView()
    let itemViewOne = UIView()
    let itemViewTwo = UIView()
    let dateLabel = GFBodyLabel(textAlignment: .center)
    
    //MARK: - Properties
    
    var username: String!
    weak var delegate: UserInfoVCDelegate!
    
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
                DispatchQueue.main.async { self.configureUIElements(with: user) }
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "Ok")
            }
        }
    }
    
    
    func configureUIElements(with user: User) {
        self.add(childVC: GFUserHeaderVC(user: user), to: self.headerView)
        self.add(childVC: GFRepoItemVC(user: user, delegate: self), to: self.itemViewOne)
        self.add(childVC: GFFollowerItemVC(user: user, delegate: self), to: self.itemViewTwo)
        self.dateLabel.text = "GitHub Since \(user.createdAt.convertToMonthYearFormat())"
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
                          height: 195)
        
        view.addSubview(itemViewOne)
        itemViewOne.anchor(top: headerView.bottomAnchor,
                           leading: view.leadingAnchor,
                           trailing: view.trailingAnchor,
                           paddingTop: padding,
                           paddingLeading: padding,
                           paddingTrailing: padding,
                           height: itemHeight)
        
        view.addSubview(itemViewTwo)
        itemViewTwo.anchor(top: itemViewOne.bottomAnchor,
                           leading: view.leadingAnchor,
                           trailing: view.trailingAnchor,
                           paddingTop: padding,
                           paddingLeading: padding,
                           paddingTrailing: padding,
                           height: itemHeight)
        
        view.addSubview(dateLabel)
        dateLabel.anchor(top: itemViewTwo.bottomAnchor,
                         leading: view.leadingAnchor,
                         trailing: view.trailingAnchor,
                         paddingTop: padding,
                         paddingLeading: padding,
                         paddingTrailing: padding,
                         height: 50)
    }
    
    //MARK: - Selectors
    
    @objc private func dismissVC() {
        dismiss(animated: true)
    }
}

//MARK: - UserInfoVCDelegate

extension UserInfoVC: GFRepoItemVCDelegate, GFFollowerItemVCDelegate {
    
    func didTapGitHubProfile(for user: User) {
        guard let url = URL(string: user.htmlUrl) else {
            presentGFAlertOnMainThread(title: "Invalid URL", message: "The url attached to this user is invalid", buttonTitle: "Ok")
            return
        }
        presentSafariVC(with: url)
    }
    
    
    func didTapGetFollowers(for user: User) {
        guard user.followers != 0 else {
            presentGFAlertOnMainThread(title: "No Followers", message: "This user has no followers 😞", buttonTitle: "Ok")
            return
        }
        delegate.didRequestFollowers(for: user.login)
        dismissVC()
    }
    
}
