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

final class PlacesViewController: UIViewController {
    
    private let mainView = PlacesView()
    var index = 0
    
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
        view = mainView
        view.backgroundColor = .white
        navigationController?.setNavigationBarHidden(true, animated: false)
        setupTableView()
        searchViewTapped()
        setupGestures()
    }
    
}

extension PlacesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func setupGestures() {
                mainView.placesTableView.panGestureRecognizer.addTarget(self, action: #selector(tableViewGestureRecognizer(gestureRecognizer:)))
    
    }
    
    @objc func tableViewGestureRecognizer( gestureRecognizer: UIPanGestureRecognizer) {
       
        guard let gestureView = mainView.placesTableView.superview else {return}
        let translation = gestureRecognizer.translation(in: gestureView)
        let velocity = gestureRecognizer.velocity(in:  gestureView)
        
        let height = UIScreen.main.bounds.height
        print(height)
        switch gestureRecognizer.state {
        case .changed:
            guard translation.y >= 0 else { return }
            
            mainView.placesTableView.transform = CGAffineTransform(translationX: 0, y: translation.y)
            self.mainView.mapView.alpha = 1
            self.mainView.minibar.alpha = 1
            mainView.placesTableView.layer.cornerRadius = 30
        case .ended:
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut) {
                if translation.y > height * 0.25 || (velocity.y) / 60 > 30 {
                    self.mainView.placesTableView.transform = CGAffineTransform(translationX: 0, y: (600))
                    self.mainView.placesTableView.alpha = 1
                    //                self.mainView.minibar.alpha = 1
                    self.navigationController?.tabBarController?.tabBar.isHidden
                    = true
                } else {
                    self.mainView.placesTableView.transform = .identity
                }
            }
            
        default:
            break
        }
  
    }
    @objc func backButtonDidTapped() {
        //        searchView.unselectIndex()
        navigationController?.tabBarController?.tabBar.isHidden = false
    }
    func setupTableView() {
        mainView.placesTableView.delegate = self
        mainView.placesTableView.dataSource = self
        
        mainView.categoriesTableView.delegate = self
        mainView.categoriesTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView == mainView.categoriesTableView ? 1 : places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == mainView.categoriesTableView {
            guard let cell: CategoryTableViewCell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.identifier) as? CategoryTableViewCell else {
                return UITableViewCell()
            }
            
            return cell
            
        }
        else if tableView == mainView.placesTableView {
            guard let cell: PlacesTableViewCell = tableView.dequeueReusableCell(withIdentifier: PlacesTableViewCell.identifier) as? PlacesTableViewCell else {
                return UITableViewCell()
            }
            self.index = indexPath.row
            print(self.index)
            cell.selectionStyle = .none
            cell.configureCell(place: places[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let place = places[indexPath.row]
        self.index = indexPath.row
        
        navigationController?.tabBarController?.tabBar.isHidden = true
        let detailViewController = SearchDetailViewController()
        detailViewController.searchDetailView.confgiure(with: place)
        
        navigationController?.pushViewController(detailViewController, animated: true)
        //        searchView.searchDetailView.confgiure(with: place)
        //        searchView.selectIndex()
    }
}


extension PlacesViewController {
    func searchViewTapped() {
        let gesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(targetViewDidTapped))
        gesture.numberOfTapsRequired = 1
        mainView.searchView.addGestureRecognizer(gesture)
    }
    
    @objc func targetViewDidTapped() {
        let sv = SearchViewController()
        navigationController?.pushViewController(sv, animated: true)
    }
}
