//
//  SearchView.swift
//  AirBnbClone
//
//  Created by Ali Eren on 14.10.2022.
//

import Foundation
import UIKit
import SnapKit

final class SearchView: UIView {
    
    private lazy var scrollContainerView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.addSubview(containerView)
        return scrollView
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.addSubview(searchView)
        view.addSubview(categoriesTableView)
        view.addSubview(placesTableView)
        return view
    }()
    
    private lazy var searchView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 30
        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: -1, height: 1)
        view.layer.shadowRadius = 2
        view.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        view.layer.shouldRasterize = true
        view.layer.rasterizationScale = UIScreen.main.scale
        view.addSubview(searchImageView)
        view.addSubview(searchLabel)
        view.addSubview(searchFilterImageView)
        return view
    }()
    
    private lazy var searchImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "magnifyingglass")
        return imageView
    }()
    
    private lazy var searchLabel: UILabel = {
        let label = UILabel()
        label.text = "Nereye?"
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    private lazy var searchFilterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "line.3.horizontal.decrease.circle")
        return imageView
    }()
    
    lazy var categoriesTableView: UITableView = {
        let view = UITableView()
        view.register(CategoryTableViewCell.self
                      , forCellReuseIdentifier: CategoryTableViewCell.identifier)
        view.rowHeight = 80
        view.alwaysBounceVertical = false
        return view
    }()
    
    lazy var placesTableView: UITableView = {
        let tv = UITableView()
        tv.register(PlacesTableViewCell.self, forCellReuseIdentifier: PlacesTableViewCell.identifier)
        tv.rowHeight = UIScreen.main.bounds.width + 100
        return tv
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
        addSubview(scrollContainerView)
        
    }
    
    private func setupLayout() {
        scrollContainerView.snp.makeConstraints { $0.edges.equalToSuperview() }
        
        containerView.snp.makeConstraints { make in
            make.height.equalTo(UIScreen.main.bounds.height)
            make.width.equalTo(UIScreen.main.bounds.width)
        }
        
        searchView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(60)
        }
        
        searchBarComponentsLayoutsSetupUp()
        
        categoriesTableView.snp.makeConstraints { make in
            make.top.equalTo(searchView.snp.bottom).offset(10)
            make.height.equalTo(100)
            make.leading.trailing.equalToSuperview()
        }
        
        placesTableView.snp.makeConstraints { make in
            make.top.equalTo(categoriesTableView.snp.bottom).offset(-20)
            make.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    private func searchBarComponentsLayoutsSetupUp() {
        searchImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.width.height.equalTo(25)
            make.centerY.equalToSuperview()
        }
        
        searchLabel.snp.makeConstraints { make in
            make.leading.equalTo(searchImageView.snp.trailing).offset(10)
            make.width.height.equalToSuperview()
        }
        
        searchFilterImageView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(20)
            make.width.height.equalTo(25)
            make.centerY.equalToSuperview()
        }
    }
}
