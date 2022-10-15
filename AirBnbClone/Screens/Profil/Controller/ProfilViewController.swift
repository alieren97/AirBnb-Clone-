//
//  ProfilViewController.swift
//  AirBnbClone
//
//  Created by Ali Eren on 24.09.2022.
//

import Foundation
import UIKit

struct Section {
    let title: String
    let options: [SettingsOptions]
}

struct SettingsOptions {
    let title: String
    let icon: UIImage?
    let handler: (()->Void)
}

class ProfilViewController: UIViewController {
    
    var models = [Section]()
    
    
    let profilView = ProfilView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view = profilView
        title = "Profil"
        navigationController?.navigationBar.prefersLargeTitles = true
        configure()
        configureTableView()
        
    }
    
    func configure() {
        self.models.append(contentsOf: [
            Section(title: "Hesap Ayarları", options: [
                SettingsOptions(title: "Kisisel Bilgiler", icon: UIImage(systemName: "person.circle")) {},
                SettingsOptions(title: "Yaptığınız ve aldığınız ödemeler", icon: UIImage(systemName: "house")) {},
                SettingsOptions(title: "Çeviri", icon: UIImage(systemName: "house")) {},
                SettingsOptions(title: "Bildirimler", icon: UIImage(systemName: "bell")) {},
                SettingsOptions(title: "Gizlilik Ve Paylaşım", icon: UIImage(systemName: "lock")) {},
            ]),
            Section(title: "Ev Sahipliği", options: [
                SettingsOptions(title: "Ev sahipliği moduna geç", icon: UIImage(systemName: "person.circle")) {},
                SettingsOptions(title: "Yerinizi kaydedin", icon: UIImage(systemName: "house")) {},
                SettingsOptions(title: "Bir deneyime ev sahipliği yapın", icon: UIImage(systemName: "house")) {},
                SettingsOptions(title: "Rehberleriniz", icon: UIImage(systemName: "house")) {},
                SettingsOptions(title: "Gizlilik Ve Paylaşım", icon: UIImage(systemName: "house")) {},
            ]),
            Section(title: "Hesap Ayarları", options: [
                SettingsOptions(title: "Kisisel Bilgiler", icon: UIImage(systemName: "person.circle")) {},
                SettingsOptions(title: "Yaptığınız ve aldığınız ödemeler", icon: UIImage(systemName: "house")) {},
                SettingsOptions(title: "Çeviri", icon: UIImage(systemName: "house")) {},
                SettingsOptions(title: "Bildirimler", icon: UIImage(systemName: "house")) {},
                SettingsOptions(title: "Gizlilik Ve Paylaşım", icon: UIImage(systemName: "house")) {},
            ]),
            Section(title: "Hesap Ayarları", options: [
                SettingsOptions(title: "Kisisel Bilgiler", icon: UIImage(systemName: "person.circle")) {},
                SettingsOptions(title: "Yaptığınız ve aldığınız ödemeler", icon: UIImage(systemName: "house")) {},
                SettingsOptions(title: "Çeviri", icon: UIImage(systemName: "house")) {},
                SettingsOptions(title: "Bildirimler", icon: UIImage(systemName: "house")) {},
                SettingsOptions(title: "Gizlilik Ve Paylaşım", icon: UIImage(systemName: "house")) {},
            ]),
        ])
    }
}


extension ProfilViewController: UITableViewDataSource, UITableViewDelegate {
    
    func configureTableView() {
        profilView.settingsTableView.delegate = self
        profilView.settingsTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier:
                                                                CustomHeaderView.identifier) as! CustomHeaderView
        view.title.text = models[section].title
        return view
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 70
    }


    func numberOfSections(in tableView: UITableView) -> Int {
        print(models.count)
        return models.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: SettingTableViewCell.identifier,
            for: indexPath
        ) as? SettingTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: model)
        return cell
    }
    
    
}
