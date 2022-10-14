//
//  SearchController.swift
//  AirBnbClone
//
//  Created by Ali Eren on 24.09.2022.
//

import Foundation
import UIKit
import SnapKit


final class SearchViewController: UIViewController {
    
    let places: [Place] = [
        Place(placeImage: "example1", placeName: "Guyonvelle,Fransa", placeRank: 4.5, placeDistance: "2.329", placeDate: "28.03.2022", placePrice: "2000"),
        Place(placeImage: "example1", placeName: "Guyonvelle,Fransa", placeRank: 4.5, placeDistance: "2.329", placeDate: "28.03.2022", placePrice: "2000"),
        Place(placeImage: "example1", placeName: "Guyonvelle,Fransa", placeRank: 4.5, placeDistance: "2.329", placeDate: "28.03.2022", placePrice: "2000"),
        Place(placeImage: "example1", placeName: "Guyonvelle,Fransa", placeRank: 4.5, placeDistance: "2.329", placeDate: "28.03.2022", placePrice: "2000"),
        Place(placeImage: "example1", placeName: "Guyonvelle,Fransa", placeRank: 4.5, placeDistance: "2.329", placeDate: "28.03.2022", placePrice: "2000"),
        Place(placeImage: "example1", placeName: "Guyonvelle,Fransa", placeRank: 4.5, placeDistance: "2.329", placeDate: "28.03.2022", placePrice: "2000"),
        Place(placeImage: "example1", placeName: "Guyonvelle,Fransa", placeRank: 4.5, placeDistance: "2.329", placeDate: "28.03.2022", placePrice: "2000"),
        Place(placeImage: "example1", placeName: "Guyonvelle,Fransa", placeRank: 4.5, placeDistance: "2.329", placeDate: "28.03.2022", placePrice: "2000"),
        Place(placeImage: "example1", placeName: "Guyonvelle,Fransa", placeRank: 4.5, placeDistance: "2.329", placeDate: "28.03.2022", placePrice: "2000"),
    ]

    private let placesTableView: UITableView = {
        let tv = UITableView()
        tv.register(PlacesTableViewCell.self, forCellReuseIdentifier: PlacesTableViewCell.identifier)
        tv.rowHeight = UIScreen.main.bounds.width + 100
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.setNavigationBarHidden(true, animated: false)
        setupTableView()
        setupViews()
        setupLayout()
    }
    
    private func setupViews() {
        //view.addSubview(searchBar)
        view.addSubview(placesTableView)
    }
    
    private func setupLayout() {
        placesTableView.snp.makeConstraints { make in
            make.height.equalTo(UIScreen.main.bounds.height)
            make.width.equalTo(UIScreen.main.bounds.width)
        }
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView() {
        placesTableView.delegate = self
        placesTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: PlacesTableViewCell = tableView.dequeueReusableCell(withIdentifier: PlacesTableViewCell.identifier) as? PlacesTableViewCell else {
            return UITableViewCell()
        }
        cell.configureCell(place: places[indexPath.row])
        return cell
    }
}
