//
//  Collect.swift
//  Shopify-Challenge
//
//  Created by Ryan Nguyen on 3/30/19.
//  Copyright © 2019 Danh Phu Nguyen. All rights reserved.
//

import Foundation

struct Collect: Decodable {
    let product_id: Int?
}

struct collectList: Decodable {
    let collects: [Collect]
}

