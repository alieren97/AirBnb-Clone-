//
//  SearchViewController.swift
//  AirBnbClone
//
//  Created by Ali Eren on 18.10.2022.
//

import Foundation
import UIKit
import SnapKit

final class SearchViewController: UIViewController {
    var popView: Bool = false
    let searchView = SearchView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        view = searchView
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.tabBarController?.tabBar.isHidden = true
        
        let backbıtem = UIBarButtonItem(customView: searchView.closeButton)
        searchView.closeButton.addTarget(self, action: #selector(backButtonDidTapped), for: .touchUpInside)
        navigationItem.leftBarButtonItem = backbıtem
        
        searchViewTapped()

    }
    
    @objc func backButtonDidTapped() {
        if(popView == true) {

            UIView.animate(withDuration: 0.5) {
                self.searchView.searchContainerView.snp.remakeConstraints { remake in
                    remake.top.equalToSuperview().inset(100)
                    remake.leading.trailing.equalToSuperview().inset(10)
                    remake.height.equalTo(UIScreen.main.bounds.width - 20)
                }
                self.searchView.searchView.snp.remakeConstraints { remake in
                    remake.top.equalTo(self.searchView.whereToGoLabel.snp.bottom).offset(10)
                    remake.trailing.leading.equalToSuperview().inset(10)
                    remake.height.equalTo(60)
                }
                self.searchView.layoutIfNeeded()
            }
            UIView.animate(withDuration: 0.5) {
                self.searchView.searchTextField.isEnabled = false
                self.searchView.whereToGoLabel.isHidden = false
                self.searchView.collectionView.isHidden = false
                self.searchView.dateView.isHidden = false
                self.searchView.guestsView.isHidden = false
                self.searchView.bottomContainerView.isHidden = false
            }
            
            searchView.closeButton.setImage(UIImage(systemName: "xmark.circle"), for: .normal)
            popView = false
            
            print(popView)
        } else {
            navigationController?.popViewController(animated: true)
            navigationController?.setNavigationBarHidden(true, animated: false)
                                                         navigationController?.tabBarController?.tabBar.isHidden = false
            popView = false
        }
      
    }
    
    func searchViewTapped() {
        let gesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(targetViewDidTapped))
        gesture.numberOfTapsRequired = 1
        searchView.searchView.addGestureRecognizer(gesture)
        print(popView)
        popView = true
    }
    
    @objc func targetViewDidTapped() {
        searchView.searchTextField.isEnabled = true
        searchView.whereToGoLabel.isHidden = true
        searchView.collectionView.isHidden = true
        searchView.dateView.isHidden = true
        searchView.guestsView.isHidden = true
        searchView.bottomContainerView.isHidden = true
        
        UIView.animate(withDuration: 0.5) {
            self.searchView.searchContainerView.snp.remakeConstraints { remake in
                remake.top.equalToSuperview().inset(100)
                remake.leading.trailing.equalToSuperview()
                remake.height.equalTo(UIScreen.main.bounds.height - 100)
            }
            self.searchView.searchView.snp.remakeConstraints { remake in
                remake.top.equalToSuperview().inset(30)
                remake.trailing.leading.equalToSuperview().inset(10)
                remake.height.equalTo(60)
            }
            self.searchView.layoutIfNeeded()
        }
        
        searchView.closeButton.setImage(UIImage(systemName: "arrow.left"), for: .normal)
    }
    
    
}
