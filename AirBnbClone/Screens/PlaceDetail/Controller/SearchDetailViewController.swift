//
//  SearchDetailViewController.swift
//  AirBnbClone
//
//  Created by Ali Eren on 11.10.2022.
//

import Foundation
import UIKit

final class SearchDetailViewController: UIViewController {
    
    
    let searchDetailView = SearchViewDetail()
    override func viewDidLoad() {
        super.viewDidLoad()
        view = searchDetailView
        configureScrollView()
        setupNavigationBar()
    }
    
}

extension SearchDetailViewController: UIScrollViewDelegate {
    func configureScrollView() {
        searchDetailView.scrollView.delegate = self
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        var offset = scrollView.contentOffset.y / 130
        if offset > 1 {
            offset = 1
            let color = UIColor(red: 1, green: 1, blue: 1, alpha: offset)
            navigationController?.navigationBar.tintColor = UIColor(hue: 1, saturation: offset, brightness: 1, alpha: 1)
            navigationController?.navigationBar.backgroundColor = color
            UIApplication.shared.statusBarUIView?.backgroundColor = color
        } else {
            let color = UIColor(red: 1, green: 1, blue: 1, alpha: offset)
            navigationController?.navigationBar.tintColor = UIColor(hue: 1, saturation: offset, brightness: 1, alpha: 1)
            navigationController?.navigationBar.backgroundColor = color
            UIApplication.shared.statusBarUIView?.backgroundColor = color
        }
    }
}

extension SearchDetailViewController {
    func setupNavigationBar() {
        let backbıtem = UIBarButtonItem(customView: searchDetailView.backButtonn)
        let heartItem = UIBarButtonItem(customView: searchDetailView.heartButtonn)
        let shareItem = UIBarButtonItem(customView: searchDetailView.shareButtonn)
        
        searchDetailView.backButtonn.addTarget(self, action: #selector(backButtonDidTapped), for: .touchUpInside)
        navigationController?.setNavigationBarHidden(false, animated: false)
        
        navigationItem.leftBarButtonItem = backbıtem
        navigationItem.rightBarButtonItems = [shareItem,heartItem]
        navigationController?.tabBarController?.tabBar.isHidden = true
        
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    @objc func backButtonDidTapped() {
        navigationController?.popViewController(animated: true)
        navigationController?.setNavigationBarHidden(true, animated: false)
                                                     navigationController?.tabBarController?.tabBar.isHidden = false
    }
}
