//
//  Searchview.swift
//  AirBnbClone
//
//  Created by Ali Eren on 18.10.2022.
//

import Foundation
import UIKit
import SnapKit

final class SearchView: UIView {
    
    let continents: [Continent] = [
        Continent(continentImage: "globe.europe.africa", title: "World"),
        Continent(continentImage: "globe.europe.africa", title: "Avrupa"),
        Continent(continentImage: "globe.europe.africa", title: "Almanya"),
        Continent(continentImage: "globe.europe.africa", title: "ABD"),
        Continent(continentImage: "globe.europe.africa", title: "Birlesik Krallik"),
        Continent(continentImage: "globe.europe.africa", title: "Avustralya"),
        Continent(continentImage: "globe.europe.africa", title: "İtalya"),
        Continent(continentImage: "globe.europe.africa", title: "Kanada"),
    ]
    
    //MARK: ContainerView
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        view.addSubview(closeButton)
        view.addSubview(searchContainerView)
        view.addSubview(dateView)
        view.addSubview(guestsView)
        view.addSubview(bottomContainerView)
        return view
    }()
    
    lazy var closeButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
        button.setImage(UIImage(systemName: "xmark.circle"), for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 20
        button.backgroundColor = .white
        button.tintColor = .black
        return button
    }()
    
     lazy var searchContainerView: UIView = {
        let view = UIView()
        view.clipsToBounds = false
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 30
        view.backgroundColor = .white
        view.addSubview(whereToGoLabel)
        view.addSubview(searchView)
        view.addSubview(collectionView)
        return view
    }()
    
    lazy var whereToGoLabel: UILabel = {
        let label = UILabel()
        label.text = "Nereye?"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    lazy var searchView: UIView = {
        let view = UIView()
        view.layer.masksToBounds = true
        view.clipsToBounds = false
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.systemGray3.cgColor
        view.addSubview(searchImageView)
        view.addSubview(searchTextField)
        return view
    }()
    
    lazy var searchTextField: UITextField = {
       let textField = UITextField()
        textField.placeholder = "Gidilecek yerleri arayın"
        textField.isEnabled = false
        return textField
    }()
        
    private lazy var searchImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "magnifyingglass")
        return imageView
    }()
    
//    private lazy var searchImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.tintColor = .black
//        imageView.contentMode = .scaleAspectFit
//        imageView.image = UIImage(systemName: "magnifyingglass")
//        return imageView
//    }()
//
//    private lazy var searchLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Gidilecek yerleri arayın"
//        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
//        return label
//    }()
    
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(ContinentsCollectionViewCell.self, forCellWithReuseIdentifier: ContinentsCollectionViewCell.identifier)
        cv.showsHorizontalScrollIndicator = false
        
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
     lazy var dateView: UIView = {
       let view = UIView()
        view.clipsToBounds = false
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 30
        view.backgroundColor = .white
        return view
    }()
    
     lazy var guestsView: UIView = {
        let view = UIView()
        view.clipsToBounds = false
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 30
        view.backgroundColor = .white
        return view
    }()
    
    lazy var bottomContainerView: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        view.addSubview(clearAllLabel)
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
    
    private lazy var clearAllLabel: UILabel = {
       let label = UILabel()
        label.text = "Hepsini temizle"
        return label
    }()
  
    lazy var pastSearchTableView: UITableView = {
        let tv = UITableView()
        tv.register(PastSearchTableViewCell.self, forCellReuseIdentifier: PastSearchTableViewCell.identifier)
        tv.rowHeight = UIScreen.main.bounds.width + 100
        return tv
    }()
    
    
   
    override init(frame: CGRect) {
        super.init(frame: .zero)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        setupViews()
        setupLayouts()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupViews(){
        addSubview(containerView)
    }
    
     private func setupLayouts(){
        containerView.snp.makeConstraints { $0.edges.equalToSuperview() }
        
        closeButton.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().inset(20)
            make.height.width.equalTo(40)
        }
        
        searchContainerView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.leading.trailing.equalToSuperview().inset(10)
            make.height.equalTo(UIScreen.main.bounds.width - 20)
            
        }
        
        whereToGoLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.leading.equalToSuperview().inset(20)
            make.height.equalTo(30)
        }
        
        searchView.snp.makeConstraints { make in
            make.top.equalTo(whereToGoLabel.snp.bottom).offset(10)
            make.trailing.leading.equalToSuperview().inset(10)
            make.height.equalTo(60)
        }
        
        searchViewLayoutSetup()
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(searchView.snp.bottom).offset(10)
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview().inset(10)
            make.height.equalTo(250)
        }
        dateView.snp.makeConstraints { make in
            make.top.equalTo(searchContainerView.snp.bottom).offset(10)
            make.trailing.leading.equalToSuperview().inset(10)
            make.height.equalTo(100)
        }
        guestsView.snp.makeConstraints { make in
            make.top.equalTo(dateView.snp.bottom).offset(10)
            make.trailing.leading.equalToSuperview().inset(10)
            make.height.equalTo(100)
        }
        
        bottomContainerViewLayoutSetup()
    }
    func searchViewLayoutSetup() {
        searchImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.height.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        searchTextField.snp.makeConstraints { make in
            make.leading.equalTo(searchImageView.snp.trailing).offset(20)
            make.top.bottom.equalToSuperview().inset(20)
        }
    }
    
    func bottomContainerViewLayoutSetup() {
        
        bottomContainerView.snp.makeConstraints { make in
            make.width.equalTo(UIScreen.main.bounds.width)
            make.height.equalTo(100)
            make.bottom.equalToSuperview()
        }
        
        clearAllLabel.snp.makeConstraints { make in
            make.width.equalTo(UIScreen.main.bounds.width / 2 - 40)
            make.leading.equalToSuperview().inset(30)
            make.top.bottom.equalToSuperview().inset(30)
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
    
//    func searchTextFieldLayoutSetup() {
//        searchTextFieldContainerView.snp.makeConstraints { make in
//            make.top.equalToSuperview().inset(100)
//            make.bottom.equalToSuperview()
//            make.leading.trailing.equalToSuperview()
//        }
//
//        searchTextStackView.snp.makeConstraints { make in
//            make.top.equalToSuperview().inset(20)
//            make.leading.trailing.equalToSuperview().inset(20)
//            make.height.equalTo(100)
//        }
//
//    }
    
}


extension SearchView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(continents.count)
        return continents.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = continents[indexPath.row]
        print(item)
        guard let cell: ContinentsCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: ContinentsCollectionViewCell.identifier, for: indexPath) as? ContinentsCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(title: item.title, imgTitle: item.continentImage)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150,  height: 150)
    }
    
    
}
