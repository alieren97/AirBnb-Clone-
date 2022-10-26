//
//  SearchDetailView.swift
//  AirBnbClone
//
//  Created by Ali Eren on 11.10.2022.
//

import Foundation
import UIKit
import SnapKit

final class SearchViewDetail: UIView {
    
    var imgList = [String]()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.addSubview(containerView)
        return scrollView
    }()

    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.addSubview(imageCollectionView)
        view.addSubview(informationView)
        return view
    }()

    lazy var backButtonn: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
        button.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 20
        button.backgroundColor = .white
        button.tintColor = .black
        return button
    }()
    
    lazy var heartButtonn: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 20
        button.backgroundColor = .white
        button.tintColor = .black
        return button
    }()
    
    lazy var shareButtonn: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
        button.setImage(UIImage(systemName:  "square.and.arrow.up"), for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 20
        button.backgroundColor = .white
        button.tintColor = .black
        return button
    }()
    
    
    private lazy var informationView: UIView = {
        let view = UIView()
        view.addSubview(placeTitle)
        view.addSubview(rankView)
        view.addSubview(divider)
        return view
    }()
    
    private lazy var imageCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(SearchDetailImageCollectionViewCell.self, forCellWithReuseIdentifier: SearchDetailImageCollectionViewCell.identifier)
        cv.showsHorizontalScrollIndicator = false
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.isPagingEnabled = true
        return cv
    }()
    
    private lazy var placeTitle: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var rankView: UIView =  {
        let view = UIView()
        return view
    }()
    
    private lazy var divider: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray3
        return view
    }()
    
    private lazy var bottomContainerView: UIView = {
       let view = UIView()
        view.addSubview(priceView)
        view.addSubview(reserveButtonView)
        return view
    }()
    
    private lazy var reserveButtonView: UIView = {
       let view = UIView()
        view.backgroundColor = .systemRed
        view.layer.cornerRadius = 10
        view.addSubview(reservationText)
       return view
    }()
    
    private lazy var reservationText: UILabel = {
        let label = UILabel()
        label.text = "Rezerve edin"
        label.textColor = .white
        return label
    }()
    
    private lazy var priceView: UIView = {
        let view = UIView()
        view.addSubview(priceLabel)
        view.addSubview(dateLabel)
        return view
    }()
    
    private lazy var priceLabel: UILabel = {
       let label = UILabel()
        label.text = "2000 ₺ gece"
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
       let label = UILabel()
        label.text = "27 Ek - 12 Oc"
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        imageCollectionView.delegate = self
        imageCollectionView.dataSource = self
        setupViews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(scrollView)
        addSubview(bottomContainerView)
    }
    
    private func setupLayout() {
        
        scrollView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview().inset(100)
        }
        
        containerView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.top.equalToSuperview().inset(-100)
            make.bottom.equalToSuperview().inset(100)
            make.height.equalTo(UIScreen.main.bounds.height + 200)
        }
                
        imageCollectionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.trailing.leading.equalToSuperview()
            make.height.equalTo(UIScreen.main.bounds.width - 30)
        }

        informationView.snp.makeConstraints { make in
            make.top.equalTo(imageCollectionView.snp.bottom).offset(10)
            make.trailing.leading.equalToSuperview().inset(20)
            make.height.equalToSuperview()
        }
        
        placeTitle.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(60)
        }
        
        divider.snp.makeConstraints { make in
            make.top.equalTo(placeTitle.snp.bottom).offset(10)
            make.trailing.leading.equalToSuperview()
            make.height.equalTo(2)
        }
        
        
        bottomContainerView.snp.makeConstraints { make in
            make.width.equalTo(UIScreen.main.bounds.width)
            make.top.equalTo(scrollView.snp.bottom).offset(0)
            make.bottom.equalToSuperview()
        }
        
        
        priceView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().inset(30)
            make.width.equalTo(UIScreen.main.bounds.width / 2)
            
        }
        priceLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.leading.equalToSuperview()
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview()
        }
        
        reserveButtonView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(22)
            make.trailing.equalToSuperview().inset(30)
            make.width.equalTo(UIScreen.main.bounds.width / 2 - 40)
        }
        
        reservationText.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
        }
        
    }
}

extension SearchViewDetail {
    func confgiure(with model: Place) {
        imgList = model.placeImage
        placeTitle.text = model.placeName
        imageCollectionView.reloadData()
    }
}

extension SearchViewDetail: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return imgList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        let item = imgList[indexPath.row]
        
        guard let cell: SearchDetailImageCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchDetailImageCollectionViewCell.identifier, for: indexPath) as? SearchDetailImageCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.width )
    }
    
}


