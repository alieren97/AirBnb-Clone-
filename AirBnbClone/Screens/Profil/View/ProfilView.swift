//
//  ProfilView.swift
//  AirBnbClone
//
//  Created by Ali Eren on 11.10.2022.
//

import Foundation
import UIKit
import SnapKit

final class ProfilView: UIView {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.addSubview(settingsTableView)
        view.backgroundColor = .white
        return view
    }()
    
    //PAGE TITLE
    private lazy var pageTitle: UILabel = {
        let label = UILabel()
        label.text = "Profil"
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        return label
    }()
    
    //PROFILE VIEW SETUP
    private lazy var profilView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [profileImageView,nameStackView])
        profileImageView.snp.makeConstraints { make in
            make.height.width.equalTo(60)
            make.top.bottom.equalToSuperview().inset(20)
        }
        nameStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(30)
            make.bottom.equalToSuperview().inset(10)
        }
        stackView.spacing = 15
        stackView.axis = .horizontal
        return stackView
    }()
    
    private lazy var profileImageView: UIImageView = {
        let imgview = UIImageView()
        let image = UIImage(named: "ali_eren")
        imgview.image = image
        imgview.clipsToBounds = true
        imgview.layer.cornerRadius = 30
        return imgview
    }()
    
    private lazy var nameStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameLabel,showProfile])
        stackView.axis = .vertical
        stackView.spacing = 0
        return stackView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Ali Eren"
        return label
    }()
    
    private lazy var showProfile: UILabel = {
        let label = UILabel()
        label.text = "Profili Göster"
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        return label
    }()
    
    
    //SETTINGS TABLE VIEW
    let settingsTableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.identifier)
        table.rowHeight = 70
        table.backgroundColor = .white
        table.sectionHeaderHeight = 70
        table.separatorStyle = .none
        table.register(CustomHeaderView.self, forHeaderFooterViewReuseIdentifier: CustomHeaderView.identifier)
        return table
    }()
    
    
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        setupViews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(containerView)
    }
    
    private func setupLayout() {
        
        containerView.snp.makeConstraints {  $0.edges.equalToSuperview() }
        //        pageTitle.snp.makeConstraints { make in
        //            make.top.equalToSuperview().inset(10)
        //            make.leading.equalToSuperview().inset(10)
        //            make.height.equalTo(50)
        //        }
        //        profilView.snp.makeConstraints { make in
        //            make.top.equalTo(pageTitle.snp.bottom).offset(10)
        //            make.leading.trailing.equalToSuperview().inset(10)
        //            make.height.equalTo(80)
        //        }
        settingsTableView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
    
    
}
