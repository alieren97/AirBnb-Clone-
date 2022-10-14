//
//  SearchDetailViewController.swift
//  AirBnbClone
//
//  Created by Ali Eren on 11.10.2022.
//

import Foundation
import UIKit

final class SearchDetailViewController: UIViewController {
    
    var place: Place?{
        didSet{
            
        }
    }
    let searchDetailView = SearchViewDetail()
    override func viewDidLoad() {
        super.viewDidLoad()
        view = searchDetailView
    }
}
