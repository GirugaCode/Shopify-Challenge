//
//  Collect.swift
//  Shopify-Challenge
//
//  Created by Ryan Nguyen on 3/30/19.
//  Copyright © 2019 Danh Phu Nguyen. All rights reserved.
//

import Foundation

struct Collect: Decodable {
    
    let id: Int?
    let product_id: String?
}

struct Collects: Decodable {
    
    let collects: [Collect]?
}

