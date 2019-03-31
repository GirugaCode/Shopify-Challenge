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
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 20)
        label.numberOfLines = 0
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let productVendor: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 20)
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
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 20)
        label.numberOfLines = 0
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setupCell() {
        addSubview(productDetailsWithImage)
        
        NSLayoutConstraint.activate([
            productDetailsWithImage.topAnchor.constraint(equalTo: topAnchor),
            productDetailsWithImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            productDetailsWithImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            productDetailsWithImage.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
    }

}
