//
//  GFDataLoadingVC.swift
//  TakeHomeProject
//
//  Created by Alexander Ha on 1/29/21.
//

import UIKit

class GFDataLoadingVC: UIViewController {
    
    //MARK: - Properties
    
    fileprivate var containerView: UIView!
    
    //MARK: - Helpers
    
    func showLoadingView() {
        containerView = UIView(frame: view.bounds)
        view.addSubview(containerView)
        
        containerView.backgroundColor = .systemBackground
        containerView.alpha = 0
        
        UIView.animate(withDuration: 0.25) { self.containerView.alpha = 0.8 }
       
        let activityIndicator = UIActivityIndicatorView(style: .large)
        containerView.addSubview(activityIndicator)
        activityIndicator.centerInView(view: containerView)
        
        activityIndicator.startAnimating()
    }
    
    
    func dismissLoadingView() {
        DispatchQueue.main.async {
            self.containerView.removeFromSuperview()
            self.containerView = nil
        }
    }
    
    
    func showEmptyStateView(with message: String, in view: UIView) {
        let emptyStateView = GFEmptyStateView(message: message)
        emptyStateView.frame = view.bounds
        emptyStateView.backgroundColor = .systemBackground
        view.addSubview(emptyStateView)
    }
}
