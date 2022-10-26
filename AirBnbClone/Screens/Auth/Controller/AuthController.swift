//
//  AuthController.swift
//  AirBnbClone
//
//  Created by Ali Eren on 22.10.2022.
//

import Foundation
import UIKit

final class AuthController: UIViewController {
    
    let authView = AuthView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view = authView
        authView.backgroundColor = .white
        setupTarget()
    }
    
    func setupTarget() {
        authView.loginButton.addTarget(self, action: #selector(didLoginButtonTapped), for: .touchUpInside)
    }
    
    
    @objc func didLoginButtonTapped() {
        var loginViewController = LoginViewController()
        let nav = UINavigationController(rootViewController: loginViewController)
        loginViewController.navigationItem.title = "Oturum açın veya kaydolun"
        let medium = UIBarButtonItem(barButtonSystemItem: .close
                                     , target: self, action: #selector(dismissLoginView))
        loginViewController.navigationItem.leftBarButtonItem = medium
        loginViewController.navigationItem.backBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action:  #selector(dismissLoginView))
        present(nav, animated: true)
    }
    
    @objc func dismissLoginView() {
        dismiss(animated: true)
    }
}
