//
//  CollectionServices.swift
//  Shopify-Challenge
//
//  Created by Ryan Nguyen on 3/31/19.
//  Copyright © 2019 Danh Phu Nguyen. All rights reserved.
//

import Foundation

struct ShopifyServices {
    
    static let shared = ShopifyServices()
    let collectionSession = URLSession(configuration: .default)
    
    // Network Closure to recieve all Shopify Collections
    func getAllCollections(_ completion: @escaping(Result<[ShopifyCollections]>) -> ()){
        
        do {
            let params: [String: Any] = ["page": "1", "access_token": "c32313df0d0ef512ca64d5b336a0d7c6"]
            let request = try NetworkRequest.configureHTTPRequest(from: .collectionList, with: params)
            
            collectionSession.dataTask(with: request) { (data, res, err) in
                
                if let response = res as? HTTPURLResponse, let unwrappedData = data {
                    
                    let result = NetworkResponse.handleNetworkResponse(for: response)
                    switch result {
                    case .success:
                        
                        let result = try? JSONDecoder().decode(CollectionList.self, from: unwrappedData)
                        guard let collections = result?.CustomCollection else { return }
                        DispatchQueue.main.async {
                            completion(Result.success(collections))
                        }
                    case .failure:
                        DispatchQueue.main.async {
                            completion(Result.failure(NetworkError.decodingFailed))
                        }
                    }
                }
                }.resume()
            
        } catch {
            completion(Result.failure(NetworkError.badRequest))
        }
    }
    
    // Network Closure to recieve all Shopify Collections IDs

    func getAllCollects(collectionID: Int,_ completion: @escaping(Result<[Collect]>) -> ()) {
        
        let parameters = [
            "collection_id":"\(collectionID)",
            "page": "1",
            "access_token": "c32313df0d0ef512ca64d5b336a0d7c6"]
        
        var components = URLComponents(string: NetworkRoute.collectsList.rawValue)
        components?.queryItems = parameters.map({ (key,value ) in
            URLQueryItem(name: key, value: value)
        })
        
        let request = URLRequest(url: (components?.url)!)
        collectionSession.dataTask(with: request) { (data, response, error) in
            
            if (error == nil) {
                guard let unwrappedData = data, let unwrappedResponse = response as? HTTPURLResponse else { return }
                let result = NetworkResponse.handleNetworkResponse(for: unwrappedResponse)
                switch result{
                    
                case .success:
                    let result = try? JSONDecoder().decode(Collects.self, from: unwrappedData)
                    guard let collects = result?.collects else { return }
                    DispatchQueue.main.async {
                        completion(Result.success(collects))
                    }
                case .failure:
                    DispatchQueue.main.async {
                        completion(Result.failure(NetworkError.decodingFailed))
                    }
                }
            }
            }.resume()
    }
    
    // Network Closure to recieve all Shopify Products

    func getAllProduct(ids: [String], _ completion: @escaping(Result<[Product]>) -> ()) {
        
        var compactedIds = ""
        ids.forEach({ compactedIds += "\($0)," })
        compactedIds.removeLast()
        let url = URL(string: "https://shopicruit.myshopify.com/admin/products.json?ids=\(compactedIds)&page=1&access_token=c32313df0d0ef512ca64d5b336a0d7c6")
        
        let request = URLRequest(url: url!)
        
        collectionSession.dataTask(with: request) { (data, response, error) in
            if (error == nil) {
                guard let unwrappedData = data, let unwrappedResponse = response as? HTTPURLResponse else { return }
                let result = NetworkResponse.handleNetworkResponse(for: unwrappedResponse)
                switch result{
                    
                case .success:
                    let result = try? JSONDecoder().decode(productList.self, from: unwrappedData)
                    guard let collects = result?.products else { return }
                    DispatchQueue.main.async {
                        completion(Result.success(collects))
                    }
                case .failure:
                    DispatchQueue.main.async {
                        completion(Result.failure(NetworkError.decodingFailed))
                    }
                }
            }
            }.resume()
    }
}
