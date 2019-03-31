//
//  CollectionsViewController.swift
//  Shopify-Challenge
//
//  Created by Ryan Nguyen on 3/30/19.
//  Copyright © 2019 Danh Phu Nguyen. All rights reserved.
//

import UIKit

class CollectionsViewController: UIViewController {
    
    let collectionViewCellId = "CustomCell"
    var dummyData = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48"]
    
    let shopifyCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        collection.backgroundColor = .gray
        collection.isScrollEnabled = true
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        shopifyCollection.delegate = self
        shopifyCollection.dataSource = self
        shopifyCollection.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: collectionViewCellId)
        view.addSubview(shopifyCollection)
        setupCollection()
    }
    
    private func pushToDetails() {
        let pushVC = DetailsViewController()
//        pushVC.collection = self.collectionToPass
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    
    private func setupCollection() {
        NSLayoutConstraint.activate([
            shopifyCollection.topAnchor.constraint(equalTo: view.topAnchor),
            shopifyCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            shopifyCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            shopifyCollection.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        
    }

}


extension CollectionsViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dummyData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = shopifyCollection.dequeueReusableCell(withReuseIdentifier: collectionViewCellId, for: indexPath) as! CustomCollectionViewCell
        cell.backgroundColor = .white
        cell.titleLabel.text = self.dummyData[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let leftAndRightPaddings: CGFloat = 30.0
        let numberOfItemsPerRow: CGFloat = 2.0
        
        let width = (collectionView.frame.width-leftAndRightPaddings)/numberOfItemsPerRow
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        pushToDetails()
    }
    
}
