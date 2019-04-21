//
//  AppleProducts.swift
//  ShoppingItems
//
//  Created by Solji Kim on 16/04/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import Foundation

class AppleProducts {
    
    var modelName: String
    var availableQty: Int
    var buyingQty: Int
    var image: String
    
    init(modelName: String, availableQty: Int, buyingQty: Int, image: String) {
        self.modelName = modelName
        self.availableQty = availableQty
        self.buyingQty = buyingQty
        self.image = image
    }
}
