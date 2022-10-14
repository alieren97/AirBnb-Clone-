//
//  PlacesTableViewCell.swift
//  AirBnbClone
//
//  Created by Ali Eren on 24.09.2022.
//

import Foundation
import UIKit
import SnapKit

class PlacesTableViewCell: UITableViewCell {
    static let identifier = "PlacesTableViewCell"
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.addSubview(placeImageView)
        view.addSubview(placeName)
        view.addSubview(placeRanking)
        view.addSubview(placeDistance)
        view.addSubview(placeDate)
        view.addSubview(placePrice)
        return view
    }()
    
    lazy var placeImageView: UIImageView = {
       let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 10
        return iv
    }()
    
    private lazy var placeName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private lazy var placeRanking: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var placeDistance: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var placeDate: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var placePrice: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
        containerView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(UIScreen.main.bounds.width)
        }
        
        placeImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(UIScreen.main.bounds.width - 60)
        }
        
        placeName.snp.makeConstraints { make in
            make.top.equalTo(placeImageView.snp.bottom).offset(10)
            make.leading.equalToSuperview()
        }
        
        placeRanking.snp.makeConstraints { make in
            make.top.equalTo(placeImageView.snp.bottom).offset(10)
            make.trailing.equalToSuperview()
        }
        
        placeDistance.snp.makeConstraints { make in
            make.top.equalTo(placeName.snp.bottom).offset(5)
            make.leading.equalToSuperview()
        }
        
        placeDate.snp.makeConstraints { make in
            make.top.equalTo(placeDistance.snp.bottom)
            make.leading.equalToSuperview()
        }
        
        placePrice.snp.makeConstraints { make in
            make.top.equalTo(placeDate.snp.bottom).offset(10)
            make.leading.equalToSuperview()
        }
    }
    
}

extension PlacesTableViewCell {
    func configureCell(place: Place) {
        placeImageView.image = UIImage(named: place.placeImage)
        placeName.text = place.placeName
        placeRanking.text = "\(place.placeRank)"
        placeDistance.text = place.placeDistance
        placeDate.text = place.placeDate
        placePrice.text = place.placePrice
    }
}
