//
//  Collection.swift
//  Shopify-Challenge
//
//  Created by Ryan Nguyen on 3/30/19.
//  Copyright © 2019 Danh Phu Nguyen. All rights reserved.
//

import Foundation

struct ShopifyCollections: Decodable {
    let id: Int?
    let title: String?
    let image: Image?
    
}

struct CollectionList: Decodable {
    let CustomCollection: [ShopifyCollections]
    
    enum CodingKeys: String, CodingKey {
        case CustomCollection = "custom_collections"
    }
}
