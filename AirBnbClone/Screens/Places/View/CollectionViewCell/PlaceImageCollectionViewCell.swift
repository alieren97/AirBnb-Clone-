//
//  PlaceImageCollectionViewCell.swift
//  AirBnbClone
//
//  Created by Ali Eren on 15.10.2022.
//

import Foundation
import UIKit
import SnapKit

final class PlaceImageCollectionViewCell: UICollectionViewCell {
    static let identifier = "PlaceImageCollectionViewCell"
    
   
    private lazy var placeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
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
        contentView.addSubview(placeImageView)
        
    }
    private func setupLayout() {
        placeImageView.snp.makeConstraints {  $0.edges.equalToSuperview() }
 
    }
}

extension PlaceImageCollectionViewCell {
    func configure(with image: String) {
        placeImageView.image = UIImage(named: image)
        
    }
}
