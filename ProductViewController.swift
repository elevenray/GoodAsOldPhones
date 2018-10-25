//
//  ProductViewController.swift
//  GoodAsOldPhones
//
//  Created by Raymond Laurente on 2/28/18.
//  Copyright © 2018 Raymond Laurente. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {
   
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    var product: Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let p = product{
            productNameLabel.text = p.name
            if let i = p.productImage{
                productImageView.image = UIImage(named: i)
            }
            
        }
    }

        @IBAction func addtoCartPressed(_ sender: AnyObject) -> Void{
        print("button tapped")
        
            guard let product = product, let price = product.price else{
                return
            }
            let alertController = UIAlertController(title:"Saved to Cart ",
                message: "Saved to cart with the price of \(price)", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(action)
            
            let order = Order()
            order.order_id = 1
            order.product = product
            
            var orders = Orders.readOrdersFromArchive()
            orders?.append(order)
            if let orders = orders{
                if(Orders.saveOrdersToArchive(orders: orders)){
                    present(alertController, animated: true, completion: nil)
                }
            }
            
            
        }
        
    
}

