//
//  LoginViewController.swift
//  AirBnbClone
//
//  Created by Ali Eren on 22.10.2022.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseFirestore

final class LoginViewController: UIViewController,UISheetPresentationControllerDelegate {
    
    override var sheetPresentationController: UISheetPresentationController {
        presentationController as! UISheetPresentationController
    }
    enum LoginType {
        case phone
        case email
    }
    
    var emailView: Bool = false
    
    var loginType: LoginType = .phone {
        didSet{
            loginView.emailLoginView.setTitle("Telefon ile devam et", for: .normal)
            loginView.emailLoginView.setImage(UIImage(named: "phone"), for: .normal)
        }
    }
    
    let loginView = LoginView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view = loginView
        setupActions()
        
        sheetPresentationController.delegate = self
        sheetPresentationController.selectedDetentIdentifier = .large
        sheetPresentationController.prefersGrabberVisible = true
        sheetPresentationController.detents = [
            .medium(),.large()]
//        navigationItem.backBarButtonItem = UIBarButtonItem(image:UIImage(systemName: "xmark.circle"),style: .plain, target:self, action: #selector(dismissLoginView))
//        navigationController?.navigationBar.topItem?.hidesBackButton = false
    }
   
}

//MARK: Actions

extension LoginViewController {
    
    
    
    func setupActions() {
        loginView.loginButton.addTarget(self, action: #selector(loginButtonDidTapped), for: .touchUpInside)
        
        let gesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(targetViewDidTapped))
        loginView.emailLoginView.addGestureRecognizer(gesture)
    }
  
    @objc func loginButtonDidTapped() {
        if (emailView == true)
        {
            guard let email = loginView.countryTextField.text, let password = loginView.phoneNumberTextField.text else { return }
            
            Auth.auth().signIn(withEmail:email, password: password) {[weak self] authResult, error in
                guard let strongSelf = self else { return}
                if let error = error {
                    print(error.localizedDescription)
                }
                guard let userid = authResult?.user.uid else { return }
                Firestore.firestore().collection("users").document(userid).getDocument { docSnap, err in
                    if let e = err {
                        print(e.localizedDescription)
                    } else {
                        if let snap = docSnap {
                            var user = UserModel(id:snap.get("id") as! String,email: snap.get("email") as! String, password: snap.get("password") as! String)
                            print(user)
                            
                        }
                      
                    }
                }
                //Retrieve data from firestore and use it
                strongSelf.dismiss(animated: true)
               
                
            }
        } else {
            print("ali")
        }
    }
    
    
     @objc func targetViewDidTapped() {
         if (emailView == false) {
             loginView.emailLoginView.setTitle("Telefon ile devam et", for: .normal)
             loginView.emailLoginView.setImage(UIImage(systemName: "phone"), for: .normal)
             loginView.countryTextField.placeholder = "E-posta"
             loginView.phoneNumberTextField.placeholder = "Password"
             emailView = true
         } else {
             loginView.emailLoginView.setTitle("E-posta ile devam et", for: .normal)
             loginView.emailLoginView.setImage(UIImage(systemName: "envelope"), for: .normal)
             loginView.countryTextField.placeholder = "Ülke/Telefon"
             loginView.phoneNumberTextField.placeholder = "Telefon numarası"
             emailView = false
         }
     }
}
