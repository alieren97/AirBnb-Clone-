//
//  CustomHeaderView.swift
//  AirBnbClone
//
//  Created by Ali Eren on 14.10.2022.
//

import Foundation
import UIKit
import SnapKit

final class CustomHeaderView: UITableViewHeaderFooterView {
    static let identifier = "CustomHeaderView"
    let title = UILabel()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureContents() {
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont.systemFont(ofSize: 27,weight: .regular)
        contentView.addSubview(title)
        
        title.snp.makeConstraints { make in
            make.height.equalTo(60)
            make.leading.equalToSuperview().inset(20)
            make.trailing.equalToSuperview()
            make.top.equalToSuperview().inset(10)
        }


    }
}
