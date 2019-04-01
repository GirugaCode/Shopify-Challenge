//
//  CustomCollectionViewCell.swift
//  Shopify-Challenge
//
//  Created by Ryan Nguyen on 3/30/19.
//  Copyright © 2019 Danh Phu Nguyen. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Heavy", size: 22)
        label.numberOfLines = 0
        label.textColor = #colorLiteral(red: 0.3336500525, green: 0.07295330614, blue: 0.3352196217, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let collectionImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
        cellStyle()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func cellStyle() {
        contentView.layer.cornerRadius = 24
    }
    
    private func setupCell() {
        collectionImageView.addSubview(titleLabel)
        addSubview(collectionImageView)
        
        
        NSLayoutConstraint.activate([
            collectionImageView.topAnchor.constraint(equalTo: topAnchor),
            collectionImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
            ])
    }
    
}
