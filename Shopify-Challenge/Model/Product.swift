//
//  Product.swift
//  Shopify-Challenge
//
//  Created by Ryan Nguyen on 3/30/19.
//  Copyright © 2019 Danh Phu Nguyen. All rights reserved.
//

import Foundation

struct Product: Decodable {
    let title: String?
    let vendor: String?
    let image: Image?
    let variants: [Variant]?
    
}

struct productList: Decodable {
    let products: [Product]
}
