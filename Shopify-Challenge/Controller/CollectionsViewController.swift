//
//  CollectionsViewController.swift
//  Shopify-Challenge
//
//  Created by Ryan Nguyen on 3/30/19.
//  Copyright © 2019 Danh Phu Nguyen. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionsViewController: UIViewController {
    
    let collectionViewCellId = "CustomCell"
    
    var collections = [ShopifyCollections]()
    
    let shopifyCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        collection.backgroundColor = #colorLiteral(red: 0.4797628522, green: 0.4728085399, blue: 0.4989538789, alpha: 1)
        collection.isScrollEnabled = true
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        reloadCollections()
        setupCollection()
    }
    
    private func setupCollection() {
        shopifyCollectionView.delegate = self
        shopifyCollectionView.dataSource = self
        self.title = "Shopify Collection"
        shopifyCollectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: collectionViewCellId)
        view.addSubview(shopifyCollectionView)
        
        
        NSLayoutConstraint.activate([
            shopifyCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            shopifyCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            shopifyCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            shopifyCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        
    }
    
    private func reloadCollections() {
        ShopifyServices.shared.getAllCollections { (collectionsGetResult) in
            switch collectionsGetResult {
            case let .success(newCollections):
                self.collections = newCollections
            case let .failure(error):
                print(error)
            }
            DispatchQueue.main.async {
                self.shopifyCollectionView.reloadData()
            }
        }
    }

}


extension CollectionsViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = shopifyCollectionView.dequeueReusableCell(withReuseIdentifier: collectionViewCellId, for: indexPath) as! CustomCollectionViewCell
        let collection = collections[indexPath.row]
        let collectionImageURL = URL(string: (collection.image?.src)!)
        cell.backgroundColor = .white
        cell.titleLabel.text = collection.title
        cell.collectionImageView.kf.setImage(with: collectionImageURL)
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
        let pushVC = DetailsViewController()
        let selectedCollection = collections[indexPath.row]
        
        ShopifyServices.shared.getAllCollects(collectionID: selectedCollection.id!) { (collectGetResult) in

            switch collectGetResult {
            case let .success(getCollect):
                pushVC.collections = selectedCollection
                pushVC.collect = getCollect
                DispatchQueue.main.async {
                    self.navigationController?.pushViewController(pushVC, animated: true)
                }
            case let .failure(error):
                print(error)
            }
        }
    }
    
}
