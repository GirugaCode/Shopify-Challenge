//
//  CustomTableViewCell.swift
//  Shopify-Challenge
//
//  Created by Ryan Nguyen on 3/30/19.
//  Copyright © 2019 Danh Phu Nguyen. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    private lazy var productDetailsWithImage: UIStackView = {
        let productStackView = UIStackView(arrangedSubviews: [productImageView, productDetails])
        productStackView.alignment = .fill
        productStackView.distribution = .fillEqually
        productStackView.axis = .horizontal
        productStackView.spacing = 0
        productStackView.isUserInteractionEnabled = false
        productStackView.translatesAutoresizingMaskIntoConstraints = false
        return productStackView
    }()
    
    private lazy var productDetails: UIStackView = {
        let productStackView = UIStackView(arrangedSubviews: [productTitle, productVendor, productInventory])
        productStackView.alignment = .fill
        productStackView.distribution = .fillEqually
        productStackView.axis = .vertical
        productStackView.spacing = 0
        productStackView.isUserInteractionEnabled = false
        productStackView.translatesAutoresizingMaskIntoConstraints = false
        return productStackView
    }()
    
    let productTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Heavy", size: 18)
        label.numberOfLines = 0
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let productVendor: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Book", size: 14)
        label.numberOfLines = 0
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let productInventory: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-LightOblique ", size: 10)
        label.numberOfLines = 0
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15))
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
        cellStyle()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
    
    private func cellStyle() {
        contentView.layer.cornerRadius = 18
        contentView.layer.shadowRadius = 2
        contentView.layer.shadowOpacity = 1
        contentView.layer.shadowColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        contentView.layer.shadowOffset = CGSize(width: 0 , height:2)
        contentView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        contentView.layer.borderColor = #colorLiteral(red: 0.4797628522, green: 0.4728085399, blue: 0.4989538789, alpha: 1)
        contentView.layer.borderWidth = 1.4
    }
    
    private func setupCell() {
        addSubview(productDetailsWithImage)
        
        NSLayoutConstraint.activate([
            productDetailsWithImage.topAnchor.constraint(equalTo: topAnchor, constant: 25),
            productDetailsWithImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            productDetailsWithImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            productDetailsWithImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -25)
            ])
    }

}
