//
//  CategoryTableViewCell.swift
//  AirBnbClone
//
//  Created by Ali Eren on 14.10.2022.
//

import Foundation
import UIKit
import SnapKit


class CategoryTableViewCell: UITableViewCell {
    static let identifier = "CategoryTableViewCell"
    var selectedIndex = 0
    
    let categories: [Categories] = [
        Categories(title: "Tasarım", image: UIImage(systemName: "sun.min")),
        Categories(title: "Kuzey Kutbu", image: UIImage(systemName: "snowflake")),
        Categories(title: "Küçük evler", image: UIImage(systemName: "moon.fill")),
        Categories(title: "Kubbeler", image: UIImage(systemName: "moon.haze.fill")),
        Categories(title: "Göl yakınında", image: UIImage(systemName: "cloud.drizzle.fill")),
        Categories(title: "Olağanüstü", image: UIImage(systemName: "cloud.hail.fill")),
        Categories(title: "Milli Parklar", image: UIImage(systemName: "snowflake")),
        Categories(title: "Milli Parklar", image: UIImage(systemName: "snowflake"))
    ]
    
    let collectionView: UICollectionView = {
          let layout = UICollectionViewFlowLayout()
          layout.minimumLineSpacing = 10
          layout.scrollDirection = .horizontal
          let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
          cv.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
          cv.showsHorizontalScrollIndicator = false
          cv.translatesAutoresizingMaskIntoConstraints = false
        cv.scrollToNextItem()
       
          return cv
      }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        setupViews()
        setupLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(collectionView)
    }
    
    private func setupLayout() {
        collectionView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
    
}

extension CategoryTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource,  UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = categories[indexPath.row]
        
        selectedIndex = indexPath.row
        guard let cell: CategoryCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 100)
    }
    
   

   
//    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        self.selectedIndex = indexPath.item
//        UIView.animate(withDuration: 1.0) {
//          //Change position of your UnderlineBar
//          self.underineBar.frame =
//          self.view.layoutIfNeeded()
//        }
//
//    }
    
}


extension UICollectionView {
    func scrollToNextItem() {
        let contentOffset = CGFloat(floor(self.contentOffset.x + self.bounds.size.width))
        self.moveToFrame(contentOffset: contentOffset)
    }

    func scrollToPreviousItem() {
        let contentOffset = CGFloat(floor(self.contentOffset.x - self.bounds.size.width))
        self.moveToFrame(contentOffset: contentOffset)
    }

    func moveToFrame(contentOffset : CGFloat) {
        self.setContentOffset(CGPoint(x: contentOffset, y: self.contentOffset.y), animated: true)
    }
}
