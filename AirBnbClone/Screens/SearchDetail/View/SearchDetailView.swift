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
    
 
    
    private lazy var scrollView: UIScrollView = {
       let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
       scrollView.addSubview(containerView)
       return scrollView
    }()
    
    private lazy var containerView: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        view.addSubview(imageCollectionView)
        view.addSubview(backButton)
        view.addSubview(informationView)
       return view
    }()
    
    lazy var backButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        button.tintColor = .black
//        button.clipsToBounds = true
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 20
//        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        button.backgroundColor = .white
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
    }
    
    private func setupLayout() {
        
        scrollView.snp.makeConstraints { $0.edges.equalToSuperview() }
        
        containerView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.top.equalToSuperview().inset(-70)
            make.height.equalTo(UIScreen.main.bounds.height + 200)
        }
        
        imageCollectionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.trailing.leading.equalToSuperview()
            make.height.equalTo(UIScreen.main.bounds.width - 50)
        }
        
        backButton.snp.makeConstraints { make in
            make.top.equalTo(imageCollectionView.snp.top).offset(70)
            make.leading.equalToSuperview().inset(30)
            make.width.height.equalTo(35)
            
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
    }
}

extension SearchViewDetail {
    func confgiure(with model: Place) {
        imgList = model.placeImage
        placeTitle.text = model.placeName
    }
}

extension SearchViewDetail: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return imgList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        let item = imgList[indexPath.row]
        print(item)
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
