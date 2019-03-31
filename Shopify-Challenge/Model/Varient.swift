//
//  Varient.swift
//  Shopify-Challenge
//
//  Created by Ryan Nguyen on 3/31/19.
//  Copyright © 2019 Danh Phu Nguyen. All rights reserved.
//

import Foundation

struct Variant: Decodable {
    let inventoryQuantity: Int
    
    enum variantContainerKeys: String, CodingKey {
        case inventoryQuantity = "inventory_quantity"
    }
}
