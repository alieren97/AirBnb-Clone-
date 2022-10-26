//
//  LoginView.swift
//  AirBnbClone
//
//  Created by Ali Eren on 22.10.2022.
//

import Foundation
import UIKit
import SnapKit

final class LoginView: UIView {
    
    
    private lazy var textFieldsStackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [countryTextField,phoneNumberTextField])
        stackView.axis = .vertical
        stackView.spacing = 1
        stackView.distribution = .fillEqually
        return stackView
    }()
    
     lazy var countryTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Ülke/Bölge"
         tf.autocapitalizationType = .none
        tf.layer.borderWidth = 1
        return tf
    }()
    
     lazy var phoneNumberTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Telefon numarası"
        tf.layer.borderWidth = 1
        return tf
    }()
    
    lazy var loginButton: UIButton = {
       let button = UIButton()
        button.setTitle("Devam Et", for: .normal)
        button.layer.cornerRadius = 10
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemRed
        return button
    }()
    
    private lazy var loginButtonsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailLoginView,appleLoginView,googleLoginView])
         stackView.axis = .vertical
         stackView.spacing = 10
         stackView.distribution = .fillEqually
         return stackView
    }()
     
    lazy var emailLoginView: UIButton = {
        let view = UIButton()
        view.setTitle("E-posta ile devam et", for: .normal)
        view.setTitleColor(.black, for: .normal)
        view.setImage(UIImage(systemName: "envelope"), for: .normal)
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 5
        view.backgroundColor = .white
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        view.tintColor = .black
        return view
    }()
    
    
    
    private lazy var appleLoginView: UIButton = {
        let view = UIButton()
        view.setTitle("Apple ile devam et", for: .normal)
        view.setTitleColor(.black, for: .normal)
        view.setImage(UIImage(systemName: "apple.logo"), for: .normal)
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 5
        view.backgroundColor = .white
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        view.tintColor = .black
        return view
    }()
    
    private lazy var googleLoginView: UIButton = {
        let view = UIButton()
        view.setTitle("Google ile devam et", for: .normal)
        view.setTitleColor(.black, for: .normal)
        view.setImage(UIImage(systemName: "goforward"), for: .normal)
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 5
        view.backgroundColor = .white
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        view.tintColor = .black
        return view
    }()
    
    private lazy var facebookLoginView: UIView = {
        let view = UIView()
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .white
        setupViews()
        setupLayouts()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(textFieldsStackView)
        addSubview(loginButton)
        addSubview(loginButtonsStackView)
    }
    
    private func setupLayouts() {
        
        textFieldsStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.leading.trailing.equalToSuperview().inset(40)
            make.height.equalTo(100)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(textFieldsStackView.snp.bottom).offset(40)
            make.leading.trailing.equalToSuperview().inset(40)
            make.height.equalTo(50)
        }
        
        loginButtonsStackView.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(50)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(175)
        }
    }
}

