//
//  SearchController.swift
//  AirBnbClone
//
//  Created by Ali Eren on 24.09.2022.
//

import Foundation
import UIKit
import SnapKit

struct Categories {
    let title: String?
    let image: UIImage?
}

final class SearchViewController: UIViewController {
    
    private let searchView = SearchView()
    
    let places: [Place] = [
        Place(placeImage: ["example1","example2","example3","example4"], placeName: "Guyonvelle,Fransa", placeRank: 4.5, placeDistance: "2.329", placeDate: "28 Ek-6 Kas", placePrice: "2000"),
        Place(placeImage:  ["example1","example2","example3","example4"], placeName: "Guyonvelle,Fransa", placeRank: 4.5, placeDistance: "2.329", placeDate: "28 Ek-6 Kas", placePrice: "2000"),
        Place(placeImage:  ["example1","example2","example3","example4"], placeName: "Guyonvelle,Fransa", placeRank: 4.5, placeDistance: "2.329", placeDate: "28 Ek-6 Kas", placePrice: "2000"),
        Place(placeImage:  ["example1","example2","example3","example4"], placeName: "Guyonvelle,Fransa", placeRank: 4.5, placeDistance: "2.329", placeDate: "28 Ek-6 Kas", placePrice: "2000"),
        Place(placeImage:  ["example1","example2","example3","example4"], placeName: "Guyonvelle,Fransa", placeRank: 4.5, placeDistance: "2.329", placeDate: "28 Ek-6 Kas", placePrice: "2000"),
        Place(placeImage:  ["example1","example2","example3","example4"], placeName: "Guyonvelle,Fransa", placeRank: 4.5, placeDistance: "2.329", placeDate: "28 Ek-6 Kas", placePrice: "2000"),
        Place(placeImage:  ["example1","example2","example3","example4"], placeName: "Guyonvelle,Fransa", placeRank: 4.5, placeDistance: "2.329", placeDate: "28 Ek-6 Kas", placePrice: "2000"),
        Place(placeImage:  ["example1","example2","example3","example4"], placeName: "Guyonvelle,Fransa", placeRank: 4.5, placeDistance: "2.329", placeDate: "28 Ek-6 Kas", placePrice: "2000"),
        Place(placeImage:  ["example1","example2","example3","example4"], placeName: "Guyonvelle,Fransa", placeRank: 4.5, placeDistance: "2.329", placeDate: "28 Ek-6 Kas", placePrice: "2000"),
    ]
    
   

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = searchView
        view.backgroundColor = .white
        navigationController?.setNavigationBarHidden(true, animated: false)
        setupTableView()
    }
 
}


extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func setupTableView() {
        searchView.placesTableView.delegate = self
        searchView.placesTableView.dataSource = self
        
        searchView.categoriesTableView.delegate = self
        searchView.categoriesTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView == searchView.categoriesTableView ? 1 : places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == searchView.categoriesTableView {
            guard let cell: CategoryTableViewCell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.identifier) as? CategoryTableViewCell else {
                return UITableViewCell()
            }
            
            return cell
            
        }
        else if tableView == searchView.placesTableView {
            guard let cell: PlacesTableViewCell = tableView.dequeueReusableCell(withIdentifier: PlacesTableViewCell.identifier) as? PlacesTableViewCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            cell.configureCell(place: places[indexPath.row])
            return cell
        }
       return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = places[indexPath.row]
        print(item)
        let searchDetailViewController = SearchDetailViewController()//Or initialize it from storyboard.instantiate method
        searchDetailViewController.searchDetailView.confgiure(with: item)
        self.navigationController?.pushViewController(searchDetailViewController, animated: true)
    }
}

