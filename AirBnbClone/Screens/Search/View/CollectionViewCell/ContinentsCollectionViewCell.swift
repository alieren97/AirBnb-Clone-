//
//  ContinentsCollectionViewCell.swift
//  AirBnbClone
//
//  Created by Ali Eren on 18.10.2022.
//

import Foundation
import UIKit

class ContinentsCollectionViewCell: UICollectionViewCell {
    static let identifier = "ContinentsCollectionViewCell"
    
    private let continentImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.clipsToBounds = false
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.tintColor = .gray
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let continentLabel: UILabel = {
       let label = UILabel()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupViews() {
        contentView.addSubview(continentImageView)
        contentView.addSubview(continentLabel)
        
    }
    
    private func setupLayout() {
        continentImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(5)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(150)
        }
        
        continentLabel.snp.makeConstraints { make in
            make.top.equalTo(continentImageView.snp.bottom).offset(1)
            make.trailing.leading.equalToSuperview().inset(5)
            
        }
    }
}


// MARK: - Configure
extension ContinentsCollectionViewCell {
    func configure(title: String, imgTitle: String) {
        continentImageView.image = UIImage(systemName: imgTitle)
        continentLabel.text = title
    }
}
