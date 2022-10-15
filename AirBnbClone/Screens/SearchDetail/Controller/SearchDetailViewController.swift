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
        view.backgroundColor = .white
        searchDetailView.backButton.addTarget(self, action: #selector(backButtonDidTapped), for: .touchUpInside)
    }
    
    @objc func backButtonDidTapped() {
        navigationController?.popViewController(animated: true)
    }

}

