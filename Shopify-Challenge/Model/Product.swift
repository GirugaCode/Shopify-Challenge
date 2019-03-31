//
//  Product.swift
//  Shopify-Challenge
//
//  Created by Ryan Nguyen on 3/30/19.
//  Copyright © 2019 Danh Phu Nguyen. All rights reserved.
//

import Foundation

struct Product: Decodable {
    let title: String
    let imageURL: String
    let vendor: String
    let inventory: Int
    
    enum productCodingKeys: String, CodingKey {
        case title
        case image
        case variants
        case vendor
    }
    
    enum imageCodingKey: String, CodingKey {
        case src
    }
}

struct productList: Decodable {
    let products: [Product]
}

struct Variant: Decodable {
    let inventoryQuantity: Int
    
    enum variantContainerKeys: String, CodingKey {
        case inventory_quantity
    }
}
