//
//  AuthView.swift
//  AirBnbClone
//
//  Created by Ali Eren on 22.10.2022.
//

import Foundation
import UIKit
import SnapKit
//import FirebaseAuth

final class AuthView: UIView {
    
    private lazy var scrollView: UIScrollView = {
       let scrollView = UIScrollView()
        scrollView.addSubview(containerView)
       return scrollView
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.addSubview(profilLabel)
        view.addSubview(loginButton)
        return view
    }()
    
    private lazy var profilLabel: UILabel = {
       let label = UILabel()
        label.text = "Profil"
        label.font = UIFont.systemFont(ofSize: 25)
        return label
    }()
    
    lazy var loginButton: UIButton = {
       let button = UIButton()
        button.setTitle("Oturum Açın", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemRed
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
        setupLayouts()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(scrollView)
    }
    
    private func setupLayouts() {
        scrollView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        containerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(UIScreen.main.bounds.height + 200)
        }
        
        profilLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(30)
            make.leading.equalToSuperview().inset(30)
            make.height.equalTo(50)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(profilLabel.snp.bottom).offset(50)
//            make.leading.trailing.equalToSuperview().inset(50)
//            make.width.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(40)
            make.height.equalTo(50)
        }
    }
    
    
}
