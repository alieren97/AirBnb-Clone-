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
    
    var imgList = [String]()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.addSubview(imageCollectionView)
        view.addSubview(placeName)
        view.addSubview(placeRanking)
        view.addSubview(placeDistance)
        view.addSubview(placeDate)
        view.addSubview(placePrice)
        return view
    }()
    
    let imageCollectionView: UICollectionView = {
          let layout = UICollectionViewFlowLayout()
          layout.minimumLineSpacing = 0
          layout.scrollDirection = .horizontal
          let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
          cv.register(PlaceImageCollectionViewCell.self, forCellWithReuseIdentifier: PlaceImageCollectionViewCell.identifier)
          cv.showsHorizontalScrollIndicator = false
          cv.layer.cornerRadius = 10
          cv.isPagingEnabled = true
          return cv
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
        imageCollectionView.dataSource = self
        imageCollectionView.delegate = self
        setupViews()
        setupLayout()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(containerView)
    }
    
    private func setupLayout() {
        containerView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(5)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(UIScreen.main.bounds.width)
        }
        
        imageCollectionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(UIScreen.main.bounds.width - 60)
        }
        
        placeName.snp.makeConstraints { make in
            make.top.equalTo(imageCollectionView.snp.bottom).offset(10)
            make.leading.equalToSuperview()
        }
        
        placeRanking.snp.makeConstraints { make in
            make.top.equalTo(imageCollectionView.snp.bottom).offset(10)
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
        imgList = place.placeImage
        placeName.text = place.placeName
        placeRanking.text = "\(place.placeRank)"
        placeDistance.text = "\(place.placeDistance) kilometre uzakta"
        placeDate.text = place.placeDate
        placePrice.text = "\(place.placePrice) ₺ gece"
    }
}

extension PlacesTableViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = imgList[indexPath.row]
        guard let cell: PlaceImageCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: PlaceImageCollectionViewCell.identifier, for: indexPath) as? PlaceImageCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 60, height: UIScreen.main.bounds.width - 60)
    }
    
}
