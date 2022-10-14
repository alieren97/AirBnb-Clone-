//
//  ProfilViewController.swift
//  AirBnbClone
//
//  Created by Ali Eren on 24.09.2022.
//

import Foundation
import UIKit


struct SettingsOptions {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (()->Void)
}

class ProfilViewController: UIViewController {
    
    var models: [SettingsOptions] = []
    
    
    
    let profilView = ProfilView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view = profilView
        configureTableView()

        
    }
    
    func configure() {
        self.models = Array(0...100).compactMap({SettingsOptions(title: "Ite \($0)", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemCyan) {
            
        }})
    }
}


extension ProfilViewController: UITableViewDataSource, UITableViewDelegate {
    func configureTableView() {
        profilView.settingsTableView.delegate = self
        profilView.settingsTableView.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = model.title
        return cell
    }
    
    
}
