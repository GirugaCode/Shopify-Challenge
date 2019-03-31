//
//  NetworkRoute.swift
//  Shopify-Challenge
//
//  Created by Ryan Nguyen on 3/31/19.
//  Copyright © 2019 Danh Phu Nguyen. All rights reserved.
//

import Foundation

public enum NetworkRoute: String {
    // Enum for the three Shopify API URLs for the challenge
    
    case collectionList = "https://shopicruit.myshopify.com/admin/custom_collections.json"
    case collectsList = "https://shopicruit.myshopify.com/admin/collects.json"
    case productList = "https://shopicruit.myshopify.com/admin/products.json"
}
