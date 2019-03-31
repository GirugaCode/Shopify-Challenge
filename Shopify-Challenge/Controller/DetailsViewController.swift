//
//  DetailsViewController.swift
//  Shopify-Challenge
//
//  Created by Ryan Nguyen on 3/30/19.
//  Copyright © 2019 Danh Phu Nguyen. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    private var productsTableView = UITableView()
    
    var collections: ShopifyCollections?
    var collect: [Collect]?
    var products = [Product]()
    
    var inventoryTotal = 0
    
    private let tableViewCellId = "CustomTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        reloadProducts()

    }
    
    private func setupTableView() {
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        productsTableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
        
        self.title = "Products"
        
        productsTableView.register(CustomTableViewCell.self, forCellReuseIdentifier: tableViewCellId)
        productsTableView.dataSource = self
        productsTableView.delegate = self
        self.productsTableView.separatorStyle = .none
        self.view.addSubview(productsTableView)
    }
    

    
    private func reloadProducts() {
        guard let productId: [String] = collect?.map({ $0.product_id!.toString() }) else { return }
        
        ShopifyServices.shared.getAllProduct(ids: productId) { (productGetResult) in
            switch productGetResult {
            case let .success(newProducts):
                self.products = newProducts
            case let .failure(error):
                print(error)
            }
            DispatchQueue.main.async {
                self.productsTableView.reloadData()
            }
        }
    }
}

extension DetailsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellId) as! CustomTableViewCell
        let product = products[indexPath.row]
        let productImageURL = URL(string: (product.image?.src)!)
        let currentInventory = product.variants
        
        for varient in currentInventory! {
            inventoryTotal += varient.inventory_quantity!
        }

        cell.productTitle.text = product.title
        cell.productVendor.text = product.vendor
        cell.productInventory.text = "x\(inventoryTotal) In Stock"
        cell.productImageView.kf.setImage(with: productImageURL)

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
        print("Value: \(products[indexPath.row])")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
